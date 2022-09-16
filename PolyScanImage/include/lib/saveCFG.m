function saveCFG(app,path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Created by Jianian Lin
% Date created: 10/22/2021
% save configuration from file to app
% saveCFG(app,path)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


CFG = load(path); 
CFG_VariableName = fieldnames(CFG);
CFG_VariableName = CFG_VariableName{1};
CFG = struct2cell(CFG); CFG = CFG{1}; 

for k = 1 : length(CFG)
    if contains(eval(['class(app.',CFG(k).name,')']),'OnOffSwitchState')
        eval(['CFG(',num2str(k),').value = logical(app.',CFG(k).name,');']);
    else
    	eval(['CFG(',num2str(k),').value = app.',CFG(k).name,';']);
    end
end
eval([CFG_VariableName,' = CFG;']);

save(path,CFG_VariableName);

end