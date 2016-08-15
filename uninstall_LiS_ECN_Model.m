function uninstall_LiS_ECN_Model
%uninstall_LiS_ECN_Model Uninstall script for LiS_ECN_Model.
%   uninstall_LiS_ECN_Model removes the folders needed by
%   the LiS ECN Model from the MATLAB search path for the
%   current session and all future sessions. 

%   Copyright 2016 Cranfield University
%   Please see accompanying licence terms at 
%   http://dx.doi.org/10.17862/cranfield.rd.c.3292031

% Remove files for current session:
removeFilesFromPath();

% Remove files for future sessions:
currentPath = path();
cleanupFcn = onCleanup(@()path(currentPath));
path(pathdef());
removeFilesFromPath();
savepath();

end % uninstall_LiS_ECN_Model



function removeFilesFromPath()
%removeFilesFromPath  Remove specified files from the MATLAB path.
%   removeFilesFromPath() does what it says on the tin!

projectRoot = fileparts(mfilename('fullpath'));
dataDir = fullfile(projectRoot, 'data');
htmlDir = fullfile(projectRoot, 'html');
imagesDir = fullfile(projectRoot, 'images');
libDir = fullfile(projectRoot, 'lib');

S = warning('query', 'all');
[lastMsg, lastMsgId] = lastwarn();
C = onCleanup(@()restoreWarningState(S, lastMsg, lastMsgId));

warning('off', 'MATLAB:rmpath:DirNotFound');

rmpath(projectRoot);
rmpath(dataDir);
rmpath(htmlDir);
rmpath(imagesDir);
rmpath(libDir);

end % removeFilesFromPath()


function restoreWarningState(S, lastMsg, lastMsgId)
warning(S);
lastwarn(lastMsg, lastMsgId);
end
