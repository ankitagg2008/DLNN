clear 
clc;
close all;
%% Image gradient
img1 = rgb2gray ( imread ('tiger.png'));
img = imresize ( img1 ,[320 ,480]) ;
X = double ( img );
mask =[ -1 ,1];

% Image derivative in x direction
derX = imfilter (X , mask ); % by default imfilt uses " correlation "
figure , imshow ( derX ,[]);title ('Image derivative in x direction')

% Image derivative in y direction
derX = imfilter (X , mask');
figure , imshow ( derX ,[]);title ('Image derivative in y direction')

% Gradient Magnitude
[Gmag , Gdir ] = imgradient (X);
figure, imshow ( Gmag ,[]);title ('Gradient Magnitude')


%% Sobel edge detection
img1 = rgb2gray ( imread ('bird.png'));
img = imresize ( img1 ,[320 ,480]) ;
X = double ( img );
% Compute x, y gradients
[ gx gy ] = imgradientxy ( img , 'sobel') ; % Note : gx , gy are not normalized
figure , imshow (( gx + 4) /8 ,[]) ,title ('Gardient in x') % value b/w 0 and 1
figure , imshow (( gy + 4) /8 ,[]) ,title ('Gardient in y') % value b/w 0 and 1

% Obtain gradient magnitude and direction
[gmag, gdir ] = imgradient (gx , gy );
figure, imshow ( gmag / (4 * sqrt (2) ) ,[]) ; % mag = sqrt (gx ^2 + gy ^2) , so [0 , (4* sqrt (2) )]
figure, imshow (( gdir + 180.0) / 360.0 ,[]) ; title ('Gradient Magnitude')% angle in degrees [ -180 , 180]
figure,
count =0;
for i =50:50:450
    count = count +1;
    binaryImage = gmag > i;
    subplot (3 ,3 , count ) , imshow ( binaryImage ) ,title ([ 'Threshold value :',num2str(i) ])
end


%% LOG edge detection
img1 = rgb2gray ( imread ('bird.png'));
img = imresize (img1 ,[320 ,480]) ;
figure, imshow (img ) , title ('Original image')

h= fspecial ('log' ,[7 7] ,1) ;
% for sigma =1 , need atleast 7 x 7 kernel

imFiltered = imfilter ( img ,h);
figure , imshow ( imFiltered ,[]) ,title ('sigma 1')

binaryImage = imFiltered > 2;
figure , imshow ( binaryImage ,[]) ,title ('Threshold =2 ')


%% Canny edge detection
img1 = rgb2gray ( imread ('bird.png'));
img = imresize (img1 ,[320 ,480]) ;
figure, imshow (img ) , title ('Original image')

ed = edge(img,'Canny',[0.001,0.03]);
figure,imshow(ed);title('Canny between [0.001, 0.03]')

