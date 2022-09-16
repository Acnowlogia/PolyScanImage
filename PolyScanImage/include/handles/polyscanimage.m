%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PolyScanImage
% Start up script of polyscanimage.
% Created by Jianian Lin
% Date created: 10/21/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evalin('base','hPSI = PSI;');
evalin('base','hPSI = hPSI.startupFcn;');
handleList = properties(PSI);

for k = 1 : length(handleList)
    if ~eval(['isempty(','hPSI.',handleList{k},')'])
        evalin('base',['hPSI.',handleList{k},'.hPSI = hPSI;']);
    end
end

hPSI.updateAll;
% for k = 1 : length(handleList)
%     evalin('base','hPSI.update;');
% end

fprintf('User interface intialized.\n')