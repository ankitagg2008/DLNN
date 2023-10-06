close all
clear
clc
%% HOG
for i=1:4
img = imread([num2str(i),'.jpg']);
img = imresize(img,[512,512]);
[featureVector,hogVisualization] = extractHOGFeatures(img,'CellSize', [16,16]);

figure;
subplot(131),imshow(img); 
subplot(132),plot(hogVisualization);
subplot(133), imshow(img); hold on; plot(hogVisualization);

disp(size(img))
disp(size(featureVector))
set(gcf,'color','w')
end

%% SIFT

for i=1:4
img = imread([num2str(i),'.jpg']);
img = imresize(img,[512,512]);
featureVector = detectSIFTFeatures(rgb2gray(img));
% Select the 30 strongest features
features = featureVector.selectStrongest(30);
figure,
imshow(img);
hold on;
plot(features)

disp(size(img))
disp(size(features))
set(gcf,'color','w')
end


%% SURF

for i=1:4
img = imread([num2str(i),'.jpg']);
img = imresize(img,[512,512]);
featureVector = detectSURFFeatures(rgb2gray(img),'NumOctaves',5);
% Select the 30 strongest features
features = featureVector.selectStrongest(6);
figure,
imshow(img);
hold on;
plot(features)

disp(size(img))
disp(size(features))
set(gcf,'color','w')
end


























