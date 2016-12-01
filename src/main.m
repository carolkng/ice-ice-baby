% IMPORTANT: Append trailing slash to folder names.
videoPath = '../media/video.mp4';
framesPath = '../media/frames/';
grayPath = '../media/grayFrames/';
bwPath = '../media/bwframes/';
maskedPath = '../media/maskedFrames/';
averagePath = '../media/averagedFrames/';

startTime = 43.345;
endTime = 56.7;

% SETUP FUNCTIONS:
% video = setup(videoPath, framesPath, startTime, endTime);
grayFrames = graySetup(framesPath, grayPath);
bwFrames = bwSetup(grayPath, bwPath);
maskedFrames = maskFrames(bwPath, maskedPath);
averagedFrames = averageFrames(maskedPath, averagePath);

% v_height = video.Height;
% v_width = video.Width;
% v_frameRate = video.FrameRate;

grayFrameX = grayFrames(41); % get gray frame from 2014/04/11
bwFrameX = bwFrames(41); % get BW frame
maskedFrameX = maskedFrames(41); % get masked BW frame
averagedFrameX = averagedFrames(41); % get masked BW frame

% ============================================================
% ========================= FIGURES ==========================
% ============================================================

% Figure 1
imshow(imread([grayFrameX.folder '/' grayFrameX.name]));
% Figure 2
imshow(imread([bwFrameX.folder '/' bwFrameX.name]));
% Figure 3
imshow(imread([maskedFrameX.folder '/' bwFrameX.name]));
% Figure 4
imshow(imread([averagedFrameX.folder '/' bwFrameX.name]));
