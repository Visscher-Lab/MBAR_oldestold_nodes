

function g_new = matrix2gifti(g_old, matrix_new, output_name)
%% comments that say what this does and explain it
% this replaces the first column in g_old.cdata 
g_new = g_old;
for i=1:size(matrix_new,1)
    g_new.cdata(i,1) = matrix_new(i);
end

save(g_new, output_name);
    