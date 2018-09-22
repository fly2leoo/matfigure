function JFrame = getJFrame(hfig)
%%
% Source code from 'junziyang'
%%
% error(nargchk(1,1,nargin));
if ~ishandle(hfig) && ~isequal(get(hfig,'Type'),'figure')
    error('The input argument must be a Figure handle.');
end
mde = com.mathworks.mde.desk.MLDesktop.getInstance;
if isequal(get(hfig,'NumberTitle'),'off') && isempty(get(hfig,'Name'))
    figTag = 'Fly2leo'; %Name the figure temporarily
    set(hfig,'Name',figTag);
elseif isequal(get(hfig,'NumberTitle'),'on') && isempty(get(hfig,'Name'))
    figTag = ['Figure ',num2str(hfig)];
elseif isequal(get(hfig,'NumberTitle'),'off') && ~isempty(get(hfig,'Name'))
    figTag = get(hfig,'Name');
else
    figTag = ['Figure ',num2str(hfig),': ',get(hfig,'Name')];
end
drawnow %Update figure window
jfig = mde.getClient(figTag); %Get the underlying JAVA object of the figure.
JFrame = jfig.getRootPane.getParent();
if isequal(get(hfig,'Name'),'Fly2leo')
    set(hfig,'Name',''); %Delete the temporary figure name
end