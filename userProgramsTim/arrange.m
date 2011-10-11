function arrange(varargin)
% function arrange(varargin)
% ---------------------------------
% only for 1280 x 1024 for other solutions please edit pos matrix (there is no direct dependence on screensize....!)
% 
% usage: 
% arrange;                  arranges all opened figures
% arrange(1:3);             arranges figures 1:3
% arrange([1 4 8]);         arranges figures 1 4 and 8
%
% -------------------------------------------------------------------------
%                  © 2004 Medical Physics, Uni Oldenburg 
% -------------------------------------------------------------------------
% author	: Thomas Rohdenburg
% version	: 1.0
% date		: 23.03.2004
% -------------------------------------------------------------------------
% changes	: -

verticalAlign=0;

fig = sort(get(0,'Children'));
if nargin==1
    if isstr(varargin{1})
        verticalAlign = 1;    
    else
        fig = varargin{1}(ishandle(varargin{1}));        
    end
end 
if nargin==2
    fig = varargin{1};
    if isstr(varargin{2})
       verticalAlign = 1; 
    end
end 

pos{1} = [324   329   687   403];
pos{2} = [[5   356   632   372];[645   356   632   372]];
pos{3} = [[6   342   418   431];[431   342   418   431];[857   342   418   431]];
pos{4} = [[5   547   632   403];[645   547   632   403];...
          [5    65   632   403];[645    65   632   403]];
pos{5} = [[5   547   418   403];[431   547   418   403];[857   547   418   403];...
          [5    65   418   403];[431    65   418   403];[857    65   418   403]];
pos{6} = [[5   547   418   403];[431   547   418   403];[857   547   418   403];...
          [5    65   418   403];[431    65   418   403];[857    65   418   403]];
pos{7} = [[5   547   312   403];[325   547   312   403];[645   547   312   403];[965   547   312   403];...
          [5    65   312   403];[325    65   312   403];[645    65   312   403];[965    65   312   403]];
pos{8} = [[5   547   312   403];[325   547   312   403];[645   547   312   403];[965   547   312   403];...
          [5    65   312   403];[325    65   312   403];[645    65   312   403];[965    65   312   403]];
pos{9} = [[5   708   418   242];[431   708   418   242];[857   708   418   242];...
          [5   387   418   242];[431   387   418   242];[857   387   418   242];...
          [5    66   418   242];[431    66   418   242];[857    66   418   242]];

iNumFigures = length(fig);
if verticalAlign
pos{4} = [pos{4}(1,:);pos{4}(3,:);pos{4}(2,:);pos{4}(4,:)];
pos{5} = [[5   547   418   403];[431   547   418   403];[857   547   418   403];...
          [5    65   418   403];[431    65   418   403];[857    65   418   403]];
pos{6} = [pos{6}(1,:);pos{6}(4,:);pos{6}(2,:);pos{6}(5,:);pos{6}(3,:);pos{6}(6,:)];
pos{7} = [[5   547   312   403];[325   547   312   403];[645   547   312   403];[965   547   312   403];...
          [5    65   312   403];[325    65   312   403];[645    65   312   403];[965    65   312   403]];
pos{8} = [pos{8}(1,:);pos{8}(5,:);pos{8}(2,:);pos{8}(6,:);pos{8}(3,:);pos{8}(7,:);pos{8}(4,:);pos{8}(8,:)];
pos{9} = [pos{9}(1,:);pos{9}(4,:);pos{9}(7,:);pos{9}(2,:);pos{9}(5,:);pos{9}(8,:);pos{9}(3,:);pos{9}(6,:);pos{9}(9,:)];
end
screensize = get(0,'ScreenSize');
if screensize(3)==1024
    for kk=1:length(pos)
        pos{kk}=pos{kk}*1024/1280;
    end
end
for k=1:iNumFigures
    Units = get(fig(k),'Units');
    set(fig(k),'Units','pixels');
    if strcmp(get(fig(k), 'MenuBar'),'figure')
        menubar(k) = 0;
    else   
        menubar(k) = 50;
    end
    figure(fig(k)),
    set(fig(k),'Position',pos{iNumFigures}(k,:)+[0 0 0 menubar(k)]);
    set(fig(k),'Units',Units);
end
drawnow;