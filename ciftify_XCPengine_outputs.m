%% Script for converting functional XCPEngine outputs to CIFTI space
% note that CIFTI_reconall must be run before this script can be run.
addpath('/data/project/vislab/MISC/Scripts/lab/');

inputvoldir='/data/project/vislab/a/MBAR/Anat_preproc/derivatives/xcpengine';% location of XCPengine outputs 

freesurfdir='/data/project/vislab/a/MBAR/Anat_preproc/derivatives/freesurfer';%path to fs dir
ciftidir='/data/project/vislab/a/MBAR/Anat_preproc/derivatives/ciftify';%path to cifity reconall dir
ciftibasedir='/data/project/vislab/a/MBAR/Anat_preproc/derivatives/ciftify_xcpengine/'; %output folder

% vol2cifti(sub,inputvol,tr,subfreesurfdir,subciftidir,ciftibasename);
%% Loop through all subjects 
cd (inputvoldir)
Allsubs=dir('*MBAR*')

for ii=118:length(Allsubs)
        sub=Allsubs(ii,1);
	sub=sub.name;
    mkdir([ciftibasedir sub]) 
        inputvol=[inputvoldir '/' sub '/baseline/regress/' sub '_baseline_residualised.nii.gz'];
        tr='2.4';
        subfreesurfdir=[freesurfdir, '/', sub];
        subciftidir=[ciftidir '/' sub];
  	ciftibasename=fullfile([ciftibasedir, sub, '/', sub]);
            vol2cifti(sub,inputvol,tr,subfreesurfdir,subciftidir,ciftibasename);
        
end



