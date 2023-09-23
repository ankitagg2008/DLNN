clear
close all
a = zeros (10) ;% array of 10 x 10 zeros
for i =1:10
 for j =1:10
     if (i >2) && (i <8)
         if (j >3) && (j <9)
            a(i ,j) =90;
         end
     end
 end
 end

 a (9 ,3) =90;
 a (6 ,5) =0;

% Averag filtering %%
mask =[1 1 1; 1 1 1; 1 1 1].* (1/9) ;
averageImg = imfilter (a , mask );
% Plot
figure,
subplot (1 ,2 ,1) , imshow (a ,[])
subplot (1 ,2 ,2) , imshow ( averageImg ,[])


%% Averaging filter of image
 % Read Image
close all
img1 = rgb2gray ( imread ('eye2_1.png') );
img1 = imresize ( img1 ,[320 ,480]) ;
figure,imshow ( img1 ) , title ('Original image')

% Uniform weights
mask1 =[1 1 1; 1 1 1; 1 1 1].* (1/9) ;
averageImg = imfilter ( img1 , mask1 );
figure , imshow ( averageImg ) , title ('Uniform filtered / averaged image')

% nonuniform weights
mask2 =[1 2 1; 2 4 2; 1 2 1].* (1/16) ;
averageImg2 = imfilter ( img1 , mask2 );
figure , imshow ( averageImg2 ) ,title ('Non - uniform filtered / averaged image')

%% Gaussian function
close all
N = 3.0;
u= linspace (-N , N );
v=u ;
[X , Y ]= meshgrid (u , v);
z =1/2* pi .* exp ( -( X .^2/2) -(Y.^2/2) ) ; % sigma =1
figure,surf (X ,Y ,z);
shading interp
axis tight



%% Gaussian image filtering
close all
img1 = rgb2gray ( imread ('eye2_1.png'));
img1 = imresize ( img1 ,[320 ,480]);
figure,imshow ( img1 ) , title ('Original image')
hsize =30; % kernel size
for s =1:4:20 % iterate value of sigma
h = fspecial ('gaussian', hsize , s); % make kernel
outIm = imfilter ( img1 ,h); % filter image with kernel 'h'
figure , imshow ( outIm )
end

%% Unsharp mask
close all
img1 = imread ('eye2_1.png');
img1 = rgb2gray ( imresize ( img1 ,[320 ,480]) );

% blurred image with Uniform weights / Average
mask1 =[1 1 1; 1 1 1; 1 1 1].* (1/9) ; % average image
averageImg = imfilter ( img1 , mask1 );
sharpImg = img1 + ( img1 - averageImg );
figure , imshow ( sharpImg ) , title ('Sharpened Image')

% Second method for blurring
hsize =9; % kernel size
sigma =5;
h = fspecial ('gaussian', hsize , sigma ); % make kernel
gImg = imfilter ( img1 ,h); % filter image with kernel 'h'
sharpImg2 = img1 + ( img1 - gImg );
figure , imshow ( sharpImg2 ) ,title ('Sharpened Image : Gaussain Blur')


%% Noise removel
close all
img1 = rgb2gray ( imread ('noise_bridge.png')) ;
img1 = imresize ( img1 ,[320 ,480]) ;
imshow ( img1 ) , title ('Original image ')

% Gaussain filtering to remove noise
hsize =3; % kernel size
sigma =1;
h = fspecial ('gaussian', hsize , sigma ); % make kernel
gImg = imfilter ( img1 ,h); % filter image with kernel 'h'
figure , imshow ( gImg ) , title ('Gaussain filtered Image');

% Uniform weights
mask1 =[1 1 1; 1 1 1; 1 1 1].* (1/9) ;
averageImg = imfilter ( img1 , mask1 );
figure , imshow ( averageImg ) , title ('Uniform filtered / averaged image')

% Median Filtering
medImg = medfilt2 ( img1 );
figure , imshow ( medImg ) , title ('Median filtered Image');
