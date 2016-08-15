function install_LiS_ECN_Model
%install_LiS_ECN_Model Installation script for LiS_ECN_Model.
%   install_LiS_ECN_Model adds the folders needed by the LiS
%   ECN Model to the MATLAB search path for the current
%   session and all future sessions.

%   Copyright 2016 Cranfield University
%   Please see accompanying licence terms at 
%   http://dx.doi.org/10.17862/cranfield.rd.c.3292031


% Add files for current session:
addFilesToPath();

% Add files for future sessions:
currentPath = path();
cleanupFcn = onCleanup(@()path(currentPath));
path(pathdef());
addFilesToPath();
savepath();

end % install_LiS_ECN_Model



function addFilesToPath()
%addFilesToPath  Add specified files to the MATLAB path.
%   addFilesToPath() does what it says on the tin!

projectRoot = fileparts(mfilename('fullpath'));
dataDir = fullfile(projectRoot, 'data');
htmlDir = fullfile(projectRoot, 'html');
imagesDir = fullfile(projectRoot, 'images');
libDir = fullfile(projectRoot, 'lib');

addpath(projectRoot, '-end');
addpath(dataDir, '-end');
addpath(htmlDir, '-end');
addpath(imagesDir, '-end');
addpath(libDir, '-end');

end % addFilesToPath()
