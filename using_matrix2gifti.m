% This script transforms minima ROIs into giftis
addpath('/data/project/vislab/MISC/Scripts/gifti-1.6')
gL_path=('/data/project/vislab/a/MBAR/MBAR_systemsegregation/MBAR_nodes/ROIs/MBAR_boundary_minimaROIs_32k_fsLR_L.func.gii');
gR_path=('/data/project/vislab/a/MBAR/MBAR_systemsegregation/MBAR_nodes/ROIs/MBAR_boundary_minimaROIs_32k_fsLR_R.func.gii');
gL_full=gifti(gL_path);
gR_full=gifti(gR_path);

gL_full.cdata(:,1)= sum(gL_full.cdata,2);
gR_full.cdata(:,1)= sum(gR_full.cdata,2);
cd /data/project/vislab/a/MBAR/MBAR_systemsegregation/MBAR_nodes/ROIs
save(gL_full, 'Left_labels_allsame.label.gii');
save(gR_full, 'Right_labels_allsame.label.gii');

% make the good matrix which is #vertices by # ROIs
gL_full=gifti(gL_path);
gR_full=gifti(gR_path);

temp = gL_full.cdata;
temp_numbers = temp .* [1: size(temp,2)];
matrix_new= sum(temp_numbers,2);
output_name='Left_labels_unique.label.gii';
gL_new = matrix2gifti(gL_full, matrix_new, output_name);

temp = gR_full.cdata;
temp_numbers = temp .* [1: size(temp,2)];
matrix_new= sum(temp_numbers,2);
output_name='Right_labels_unique.label.gii';
gR_new = matrix2gifti(gR_full, matrix_new, output_name);