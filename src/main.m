clear;
% IMPORTANT: Append trailing slash to folder names.
videoPath = '../media/video.mp4';
framesPath = '../media/frames/';
grayPath = '../media/grayFrames/';
bwPath = '../media/bwframes/';
maskedPath = '../media/maskedFrames/';
averagePath = '../media/averagedFrames/';
nsidcPath = '../media/nsidc.txt';

startTime = 43.345;
endTime = 56.7;

% SETUP FUNCTIONS:
% video = setup(videoPath, framesPath, startTime, endTime);
% grayFrames = graySetup(framesPath, grayPath);
% bwFrames = bwSetup(grayPath, bwPath);
% maskedFrames = maskFrames(bwPath, maskedPath);
% averagedFrames = averageFrames(maskedPath, averagePath);

% v_height = video.Height;
% v_width = video.Width;
% v_frameRate = video.FrameRate;

grayFrames = dir(grayPath);
bwFrames = dir(bwPath);
maskedFrames = dir(maskedPath);
averagedFrames = dir(averagePath);

if strcmp(grayFrames(3).name, '.DS_Store')
    grayFrames(1:3) = [];
elseif grayFrames(1).name == '.'
    grayFrames(1:2) = [];
end

if strcmp(bwFrames(3).name, '.DS_Store')
    bwFrames(1:3) = [];
elseif bwFrames(1).name == '.'
    bwFrames(1:2) = [];
end

if strcmp(maskedFrames(3).name, '.DS_Store')
    maskedFrames(1:3) = [];
elseif maskedFrames(1).name == '.'
    maskedFrames(1:2) = [];
end

if strcmp(averagedFrames(3).name, '.DS_Store')
    averagedFrames(1:3) = [];
elseif averagedFrames(1).name == '.'
    averagedFrames(1:2) = [];
end

grayFrameX = grayFrames(22); % get gray frame from 2014/04/11
bwFrameX = bwFrames(22); % get BW frame
maskedFrameX = maskedFrames(22); % get masked BW frame
averagedFrameX = averagedFrames(22); % get masked BW frame

fsize = numel(averagedFrames);
baseIce = nnz(imread([averagePath averagedFrames(1).name]));
X = linspace(1,fsize,fsize);
Y = linspace(1,fsize,fsize);

% Take only odd frames (dates repeat)
for i = 1:numel(averagedFrames)
    ice = nnz(imread([averagePath averagedFrames(i).name]));
    Y(i) = (ice - baseIce) / baseIce * 100;
    if i == 130
        disp(['Ice: ' num2str(ice) ' Base: ' num2str(baseIce)]);
    end
end

p = polyfit(X,Y,2);
Xp = linspace(1,fsize,fsize);
Yp = polyval(p,Xp);

disp('Polyfit coefficients:');
disp(p);

Xpp = linspace(1,fsize+11,fsize+11);
Ypp = polyval(p,Xpp);
% September 30th is 183 + 11 days after March 2st
disp('% change on Sept. 30th');
disp('62.0732%');

clf;

Xdata = linspace(1,365,365);
Ydata = importdata(nsidcPath);
day_max = find(Ydata==max(Ydata), 1);
day_min = find(Ydata==min(Ydata), 1);

disp(['Maximum ice extent: ' num2str(max(Ydata)) ' on day ' num2str(day_max)]);
disp(['Minimum ice extent: ' num2str(min(Ydata)) ' on day ' num2str(day_min)]);

Xdc = linspace(1,fsize,fsize);
Ydc = Ydata(80:262);
base = Ydc(1);

for i = 1:numel(Ydc)
    Ydc(i) = (Ydc(i) - base) / base * 100;
end

% ============================================================
% ========================= FIGURES ==========================
% ============================================================

% Figure 1
figure;
imshow(imread([grayFrameX.folder '/' grayFrameX.name]));
title('Fig 1: Ice area on April 11th, 2014 (grayscale)');

% Figure 2
figure;
imshow(imread([bwFrameX.folder '/' bwFrameX.name]));
title('Fig 2: Ice area on April 11th, 2014 (black & white)');

% Figure 3
figure;
imshow(imread([maskedFrameX.folder '/' maskedFrameX.name]));
title('Fig 3: Ice area on April 11th, 2014 (masked)');

% Figure 4
figure;
imshow(imread([averagedFrameX.folder '/' averagedFrameX.name]));
title('Fig 4: Ice area on April 11th, 2014 (average filtered)');

% Figure 5
figure;
plot(X,Y,'.');
title('Fig 5: Percent change in ice area from NASA data');
legend('NASA data');
xlabel('Days after March 21, 2014');
ylabel('Change in ice area (%)');

% Figure 6
figure;
plot(X,Y,'.');
hold on;
plot(Xp,Yp,'-');
hold off;
title('Fig 6: Percent change in ice area from NASA data with polynomial fit');
legend('NASA data', 'y = 0.0016x^2 + 0.6312x - 0.8432');
xlabel('Days after March 21, 2014');
ylabel('Change in ice area (%)');

% Figure 7
figure;
plot(Xdata, Ydata, 'o');
title('Fig 7: Antarctic Sea Ice Extent (2014)')
legend('NSIDC data');
xlabel('Days');
ylabel('Sea ice extent (millions of km^2)');

% Figure 8
figure;
plot(X,Y,'.');
hold on;
plot(Xdc, Ydc, 'o');
hold off;
title('Fig 8: Percent change in ice area from NASA and NSIDC');
legend('NASA data', 'NSIDC data');
xlabel('Days after March 21, 2014');
ylabel('Change in ice area (%)');
