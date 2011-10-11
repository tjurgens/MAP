function xticklabel_rotate(xTickLabels, varargin)
% =============================================================================================
%  function xticklabel_rotate(xTickLabels, angle)
% =============================================================================================
%  rotates xTickLabels at the given angle 
%  xTickLabels can be either a vector or a cellarray 
%
%  usage:   xticklabel_rotate([1 3 4 5 6],45);
%           xticklabel_rotate({'January';'February';'March'}, 90);
%           xticklabel_rotate({'January';'February';'March'});   default is 90 degrees
% 
%       
% =============================================================================================
% © 03/2003 HDA, Author: Thomas Rohdenburg
%   (based on an idea of Gilbert Denis,  Ph.D., physical oceanography, Canada)
%   version: 1.0
%	Date:	24.03.2003 , small bugbix 07.01.2004
%	12.01.06 variable argument input, automatic axis resizing 
% =============================================================================================

% initializing
[rotation, step,arglist,XTick]=deal([]);
if nargin==0
    xTickLabels = cellstr(get(gca,'XtickLabel'));
    XTick = get(gca,'XTick');
end

if nargin>1
    rotation = varargin{1};     
end
if nargin>2
    step = varargin{2};
end
if nargin>3
    arglist = varargin(3:end);
end

if isempty(rotation), rotation=90;end
if isempty(step), step=1;end

if isnumeric(xTickLabels)
    xTickLabels=num2cell(xTickLabels);
end
if isempty(XTick)
XTick = 1:step:length(xTickLabels)*step;
end

%Set the Xtick locations and set XTicklabel to an empty string
set(gca,'XTick',XTick,'XTickLabel','')

% Determine the location of the labels based on the position
% of the xlabel
hxLabel = get(gca,'XLabel');  % Handle to xlabel
xLabelString = get(hxLabel,'String');

if ~isempty(xLabelString)
    
   warning('You may need to manually reset the XLABEL vertical position')
end

set(hxLabel,'Units','data');
xLabelPosition = get(hxLabel,'Position');
y = xLabelPosition(2);

% Place the new xTickLabels by creating TEXT objects
n=0;
for i = 1:step:length(xTickLabels)*step
    n=n+1;
   hText(i) = text(XTick(n), y, num2str(xTickLabels{n}));
end

% Rotate the text objects by 90 degrees
set(hText(hText~=0),'Rotation',rotation,'HorizontalAlignment','right','interpreter','none')
if ~isempty(arglist)
set(hText(hText~=0),arglist{:});
end


% resize gca to match axis labels
currentHandles = hText(hText~=0);

units = get(currentHandles(1),'Units');
set(currentHandles,'Units','normalized');
ex=cell2mat(get(currentHandles,'Extent'));
mx=min(0.9*max(ex(:,4)),0.5);
axunits = get(gca,'Units');
set(gca,'units','normalized');
pos= get(gca,'Position');
set(gca,'position',[pos(1),mx,pos(3),pos(4)-mx+pos(2)]);
set(gca,'units',axunits);
set(currentHandles,'Units',units);


%------------- END OF CODE --------------
