function [C] = get_result_from_dir(dirname,delimiter)
% Reads all files in a directory, and return matrix elements separated by
% delimiter from file contents

    C = [];
    
    % Read directory
    files = dir(dirname);

    % Sort filenames in dir
    filenames = {files.name};
    [dummy, index] = sort_nat(filenames); % Sort numbers in string logically
    % re-index the files array:
    files = files(index);

    % Combine files to one large array
    for i=1:length(files),
       if (files(i).name == '.') % Do nothing
       elseif (strcmp(files(i).name,'..')) % Do nothing
       else 
           A = dlmread([dirname,files(i).name],delimiter); % Read file contents into memory
           C = matrix_align_and_glue(C,A,1);
       end
    end
end