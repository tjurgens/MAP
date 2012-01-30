function subarrange(hFigure, nRows, nColumns, varargin)
% SUBARRANGE arrange subplots in a figure by removing inner distances
% 
% USAGE
%     subarrange(handle, nRows, nColumns)
%     subarrange(gcf, 3, 2)
%     
% INPUT
%     handle    - a figure handle containing subplots
%     nRows     - number of rows to plot
%     nColumns  - number of columns to plot
%     
% EXAMPLE
%     figure(42),
%     subplot(2,2,1), imagesc(randn(256)-4);
%     subplot(2,2,2), imagesc(randn(256)+4);
%     subplot(2,2,3), imagesc(rand(256));
%     subplot(2,2,4), imagesc(randn(256));
% 
%     % rearrange the subplots
%     subarrange(42, 2, 2);
% 
%     % arrange again, but use only 80% of the image (centred)
%     subarrange(42, 2, 2, [0.1 0.1 0.8 0.8]);
% 
%      
% The plots will be arranged like this (x denotes a printed x-axis, y 
% denotes a printed y-axis):
% 
%   _x_x_x_x_x_
% y| 1 2 3 4 5 |y
% y| 6 ...     |y
% y|           |y
% y|           |y
% y|___________|y
%    x x x x x 
% 
% ASSUMPTIONS
%     * all children of the figure described in <handle> are subplots.
%     * even number of equally sized subplots
%       (no fancy subplot(2,2,[1 3]) support)
%     * all internal axes can be safely removed, i.e. the inner subplots
%       are plotted against the same axes as the edge subplots.
%     * no subplot contains titles.
%     * the axes' ticks are taken care of somewhere else such that they
%       won't overlap.
% 
% TODO
%     * Proper title handling.
%     * Handling of groups of subplots. If not all subplots in rows/columns
%       share the same axes, split them into groups
%     * check if direct use of axes('position', ...) makes things easier
% 
% see also SUBPLOT
% 
% VERSION
% 09 Oct 09, j.bach@uni-oldenburg.de

%% get all subplots (children) in the figure
hSub = flipud(get(hFigure, 'Children')); % use flipud to sort the handles from top left subfigure to bottom right subfigure

if length(hSub) ~= nRows*nColumns
    error('Number of rows times number of columns does not equal number of subplots.')
end

% total number of subplots
nPlots=nRows*nColumns;


%% Window Real Estate™ presents...

% define usable area of the figure window (normalised to 1x1)
% (It's kinda nonsense to call these variables 'absolute' since they're
% normalised to 1x1, but 'relative' should be used for inter-subplot
% relations.)
% default: fill the whole window
vAbsolutePosition = [0 0 1 1 ];

if nargin==4 % one geometry vector as varargin
        vAbsolutePosition = varargin{1};
        if length(vAbsolutePosition) ~= 4
            error('If four input arguments are given, the last one must be a position vector with 4 entries.')
        end
end

nAbsXShift = vAbsolutePosition(1);
nAbsYShift = vAbsolutePosition(2);
nAbsX      = vAbsolutePosition(3);
nAbsY      = vAbsolutePosition(4);

if nargin>4
    nAbsXShift = varargin{1};
    nAbsYShift = varargin{2};
    if nargin>5
        nAbsX = varargin{3};
        if nargin>6
            nAbsY = varargin{4};
        end
    end
end


% check if no more than the whole window (1x1) is filled
if (nAbsXShift+nAbsX)>1 || (nAbsYShift+nAbsY)>1
    error('Requested relative plot size is larger than 1x1.') % ^^
end


%% preliminaries I: set axis to outside
% plots on the left are at the beginning of each row, i.e. have indices in
% steps of nColumns starting at 1
for iPlot = 1:nColumns:nRows*nColumns
    set(hSub(iPlot), 'yAxisLocation', 'left');
end
for iPlot = 1:nColumns
    set(hSub(iPlot), 'xAxisLocation', 'top');
end
% plots on the right are at the end of each row, i.e. have indices in steps of nColumns starting at nColumns
for iPlot = nColumns:nColumns:nRows*nColumns
    set(hSub(iPlot), 'yAxisLocation', 'right');
end
for iPlot = ((nRows-1)*nColumns)+1:nRows*nColumns
    set(hSub(iPlot), 'xAxisLocation', 'bottom');
end


%% preliminaries II: let the plots fill more of the available area
for iRow = 1:nRows
    for iColumn = 1:nColumns
        % count to current plot handle:
        iPlot = (iRow-1)*nColumns+iColumn;

        % set outer geometry to (1/n x 1/m)*(total available area)
        currGeometry = [ nAbsXShift+(iColumn-1)*nAbsX/nColumns ...
                         nAbsY*(nRows-iRow)/nRows+nAbsYShift ...
                         nAbsX/nColumns ...
                         nAbsY/nRows];
        set(hSub(iPlot), 'OuterPosition', currGeometry);
        
        % ugly workaround: remove titles in all but the first row
        if iRow>1
            title('');
        end
    end
end


%% compute available "pure" plot area (without axes), normalised to 1x1

% space lost due to left y axis:
tmp = get(hSub(1), 'TightInset');
nLeftX=tmp(1);
% space lost due to right y axis:
tmp = get(hSub(nColumns), 'TightInset');
nRightX=(tmp(1)+tmp(3));

% space lost due to bottom x axis:
tmp = get(hSub(end), 'TightInset');
nBottomY=tmp(2);
% space lost due to top x axis:
tmp = get(hSub(1), 'TightInset');
nTopY=(tmp(1)+tmp(3));

clear tmp;

% compute full inner space:
nAvailableX = nAbsX-nLeftX-nRightX;
nAvailableY = nAbsY-nBottomY-nTopY;
% compute inner space per plot:
nPlotX = nAvailableX/nColumns;
nPlotY = nAvailableY/nRows;


%% remove inner axes
% remove x axes from 2nd to (n-1th) row 
for iPlot = nColumns+1:nPlots-nColumns
    set(hSub(iPlot), 'xticklabel', []);
end

% remove y axes from 2nd to (m-1th) column
% i.e. keep y axes only on 1st and last column
vUnchanged = [1:nColumns:nRows*nColumns nColumns:nColumns:nRows*nColumns];
for iPlot = setdiff(1:nPlots, vUnchanged)
    set(hSub(iPlot), 'yticklabel', []);
end


%% eventually, we glue the array of plots together
for iRow = 1:nRows
    for iColumn = 1:nColumns
        % count to current plot handle:
        iPlot = (iRow-1)*nColumns+iColumn;

        % compute current xShift
        currShiftX = nLeftX + (iColumn-1)*nPlotX + nAbsXShift;
        % compute current xShift
        currShiftY = nBottomY + (nRows-iRow)*nPlotY + nAbsYShift;
        % set inner geometry to 1/X x 1/Y
        %%%%% HERE I PUT IN 0.9 TO ALLOW A LITTLE SPACE BETWEEN COLUMNS
        set(hSub(iPlot), 'Position', [ currShiftX currShiftY nPlotX*0.9 nPlotY ]);
    end
end


end
