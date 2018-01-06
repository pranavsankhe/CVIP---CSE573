function [ warp_im ] = warpA( im, A, out_size )
% warp_im=warpAbilinear(im, A, out_size)
% Warps (w,h,1) image im using affine (3,3) matrix A 
% producing (out_size(1),out_size(2)) output image warp_im
% with warped  = A*input, warped spanning 1..out_size
% Uses nearest neighbor mapping.
% INPUTS:
%   im : input image
%   A : transformation matrix 
%   out_size : size the output image should be
% OUTPUTS:
%   warp_im : result of warping image 
warp_im=zeros(out_size(1),out_size(2)); 
for i=1:out_size(1)        
    for j=1:out_size(2)    
        temp=A*[i;j;1];     %Multiply A and input co-ordinate and obtain new co-ordinates
        new=round(temp);    %Round off the matrix for integer values
        a=new(1,1);
        b=new(2,1);
        if a>0 && a<=200 && b>0 && b<=150      %ignore negative and out of bound values
            warp_im(a,b)=im(i,j); 
        end
    end
end
end
        
    
