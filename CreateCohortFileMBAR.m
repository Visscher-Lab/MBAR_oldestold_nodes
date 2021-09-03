%% Create cohort table needed to run XCP on pvts subs. 
%4 columns of id0, id1,id2, img
% ISY 10.1.19
%updated 8/12/20 for MBAR project 
basepath='/data/project/vislab/a/MBAR/Anat_preproc/derivatives/fmriprep'; % path to fmriprep 
files=dir([basepath '/sub*']); 
%% Define Subs
dirFlags=[files.isdir];
subfolder=files(dirFlags); 
%%
id0={};id1={};img={};% define empty cells to add to in for loop  
times={'baseline'};
nifti_AP='_task-rest_space-T1w_desc-preproc_bold.nii.gz';
scans={nifti_AP};
%% Loop through all subs
for ii=1:length(subfolder)%for each subjects folder
            id0(end+1,1)={subfolder(ii).name}; 
            id1(end+1,1)=times;
            img(end+1,1)={strcat(basepath,'/',subfolder(ii).name,'/','func/',...
                strcat(subfolder(ii).name,scans))};
            
end

%%
XCP_table=table(id0,id1,img);
writetable(XCP_table,'MBAR_cohorttable_single_struc.csv')
