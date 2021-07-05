
clearvars;
close all;
clc;

I = imread('64.tif'); 

if(size(I,3) == 3) 
    I = rgb2gray(I);
end

% imshow(I), title('Original image');

% figure
% for i = 1:8
%     Ib = bitget(I,i);
%     subplot(2,4,i), imshow(Ib,[]), title(strcat('bitplane ', num2str(i)));
% end

% figure
Ib1 = bitget(I,1);
% imshow(Ib1,[]);

i=1;
j=1;

combineStringBinary = "";

while 1
    stringBinary = append(num2str(Ib1(i)),...
        num2str(Ib1(i+1)),num2str(Ib1(i+2)),...
        num2str(Ib1(i+3)),num2str(Ib1(i+4)),...
        num2str(Ib1(i+5)),num2str(Ib1(i+6)),num2str(Ib1(i+7)));
    i = i + 8;
    
%     disp(stringBinary);
    if mod(strlength(stringBinary),8) == 0
        combineStringBinary = strcat(stringBinary);
        word=char(bin2dec(combineStringBinary));
%         disp(combineStringBinary);
        arr(j) = word;
        j = j + 1;
        if combineStringBinary == '00100100';
            break;
        end
    end
end

disp(arr);

