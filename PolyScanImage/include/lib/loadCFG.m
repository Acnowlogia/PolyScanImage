function loadCFG(app,path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/21/2021
% load configuration from file to app
% loadCFG(app,path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

CFG = struct2cell(load(path)); CFG = CFG{1}; 

for k = 1 : length(CFG)
    eval(['app.',CFG(k).name,' = CFG(',num2str(k),').value;']);
end

end