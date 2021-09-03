function SplitCohortFile(inputpath,outputfolder)
% Written with MATLAB R2019a
% Script evidentally has issues will previous 
% versions of matlab due to readtable function.
% Further testing needed to verify. 12/11/2019 PS

t = readtable(inputpath,'Format','%s%s%s');
uniquesubs = table2cell(unique(t(:,1)));

newtablerow = 0;
newtable = t(1,:);
for i = 1:length(uniquesubs)
    for j = 1:size(t,1)
        if strcmp(string(cell2mat(table2cell(t(j,1)))), string(uniquesubs{i}))
            newtablerow = newtablerow + 1;
            newtable(newtablerow,:) = t(j,:);
        else
            if newtablerow > 0
                newfilepath = fullfile(outputfolder,[char(cell2mat(table2cell(t(j-1,1)))) '_cohort.csv']);
                writetable(newtable,newfilepath);
                clear newtable;
                newtablerow = 0;
                newtable = t(1,:);
            end
        end
    end
end

if newtablerow > 0
    newfilepath = fullfile(outputfolder,[char(cell2mat(table2cell(t(j-1,1)))) '_cohort.csv']);
    writetable(newtable,newfilepath);
    clear newtable;
end

