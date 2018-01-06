function [rgbResult] = alignChannels(red, green, blue)
% alignChannels - Given 3 images corresponding to different channels of a
%       color image, compute the best aligned result with minimum
%       aberrations
% Args:
%   red, green, blue - each is a matrix with H rows x W columns
%       corresponding to an H x W image
% Returns:
%   rgb_output - H x W x 3 color image output, aligned as desired

%% Write code here
%creating a window at the center of the blue and green image, to compare
%with the center of the red image.

%The window is 200*200 pixel in dimension
%Window starts from [300,300]
l=200;
b=200;
blue_win=blue(300:300+l,300:300+b);
green_win=green(300:300+l,300:300+b);
p=ori(red,blue_win);
q=ori(red,green_win);
%aligning the images by shifting the image matrix with the obtained amount of pixels
blue=circshift(blue,300-p,1);
green=circshift(green,300-q,1);

rgbResult=cat(3,red,green,blue);


% write ssd function
function a=ssd(mat1,mat2)
mat=mat1-mat2;
mat=mat.^2;
a=sum(sum(mat));
end


% Write origin fuction. It provides the amount of rows the images must be
% shifted to align properly
function f=ori(mat1,mat2)
%l and b are the end coordinates if the window that ae updated after each
%iteration of the loop
l=468;
b=468;

for c=268:332
    for r=268:332
        mat_1=mat1(r:l,c:b);
        a=ssd(mat_1,mat2);       % calculating ssd and storing the minimum ssd value
        if (r==268 && c==268)
            d=a;
            l=l+1;
        elseif a<=d
            d=a;
            f=r;
            l=l+1;
            
        else
            l=l+1;
        end
    end
     l=468; 
     b=b+1;
end
end
end
