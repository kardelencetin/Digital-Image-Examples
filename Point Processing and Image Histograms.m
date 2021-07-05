
clearvars;
close all;
clc;

I1 = imread('A0.tif');
if(size(I1,3) == 3) 
    I1 = rgb2gray(I1);
end

% ADD 128

I2 = imadd(I1,128);

x = 0:255;
y = x+128;
ind = find(y>255);
y(ind) = 255;

figure, subplot(2,5,1), imshow(I1), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I2 = I1+128'), axis square;
subplot(2,5,5), imshow(I2), title('I1+128');
subplot(2,5,6), imhist(I1), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I1(:)),"Original max: "+max(I1(:)),"Original mean: "+mean(I1(:))," ","Modified min: "+min(I2(:)),"Modified max: "+max(I2(:)),"Modified mean: "+mean(I2(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1], 'FitBoxToText','on'); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
% fprintf('Original min: %f\n', min(I1(:)))
% fprintf('Original max: %f\n', max(I1(:)))
% fprintf('Original mean: %f\n',mean(I1(:)))
% fprintf('\n')
% fprintf('Modified min: %f\n', min(I2(:)))
% fprintf('Modified max: %f\n', max(I2(:)))
% fprintf('Modified mean: %f\n',mean(I2(:))) 
subplot(2,5,10), imhist(I2), title('Modified Histogram'), axis square;

%SUBTRACT 128

x = 0:255;
y = x-128;
ind = find(y<0);
y(ind) = 0;
I3 = imsubtract(I1,128);
figure, subplot(2,5,1), imshow(I1), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I3 = I1-128'), axis square;
subplot(2,5,5), imshow(I3), title('I1-128'); 
subplot(2,5,6), imhist(I1), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I1(:)),"Original max: "+max(I1(:)),"Original mean: "+mean(I1(:))," ","Modified min: "+min(I3(:)),"Modified max: "+max(I3(:)),"Modified mean: "+mean(I3(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1], 'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I3), title('Modified Histogram'), axis square;

%MULTIPlY BY 2

x = 0:255;
y = x*2;
ind = find(y>255);
y(ind) = 255;

I4 = immultiply(I1,2);
figure, subplot(2,5,1), imshow(I1), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I4 = I1*2'), axis square;
subplot(2,5,5), imshow(I4), title('I1*2'); 
subplot(2,5,6), imhist(I1), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I1(:)),"Original max: "+max(I1(:)),"Original mean: "+mean(I1(:))," ","Modified min: "+min(I4(:)),"Modified max: "+max(I4(:)),"Modified mean: "+mean(I4(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I4), title('Modified Histogram'), axis square;

%DIVIDE BY 2

x = 0:255;
y = x/2;

I5 = imdivide(I1,2); 
figure, subplot(2,5,1), imshow(I1), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I5 = I1/2'), axis square;
subplot(2,5,5), imshow(I5), title('I1/2'); 
subplot(2,5,6), imhist(I1), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I1(:)),"Original max: "+max(I1(:)),"Original mean: "+mean(I1(:))," ","Modified min: "+min(I5(:)),"Modified max: "+max(I5(:)),"Modified mean: "+mean(I5(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I5), title('Modified Histogram'), axis square;

% NEGATIVE IMAGE

x = 0:255;
y = 255-x;

I6 = imcomplement(I1);

figure, subplot(2,5,1), imshow(I1), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function'), axis square;
subplot(2,5,5), imshow(I6), title('Negative image'); 
subplot(2,5,6), imhist(I1), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I1(:)),"Original max: "+max(I1(:)),"Original mean: "+mean(I1(:))," ","Modified min: "+min(I6(:)),"Modified max: "+max(I6(:)),"Modified mean: "+mean(I6(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I6), title('Modified Histogram'), axis square;

%---------------------------------------------------------------------------------------------------

I7 = imread('A1.tif');
if(size(I7,3) == 3) 
    I7 = rgb2gray(I7);
end

%ADD 128

I8 = imadd(I7,128);

x = 0:255;
y = x+128;
ind = find(y>255);
y(ind) = 255;

figure, subplot(2,5,1), imshow(I7), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I8 = I7+128'), axis square;
subplot(2,5,5), imshow(I8), title('I7+128');
subplot(2,5,6), imhist(I7), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I7(:)),"Original max: "+max(I7(:)),"Original mean: "+mean(I7(:))," ","Modified min: "+min(I8(:)),"Modified max: "+max(I8(:)),"Modified mean: "+mean(I8(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1] ,'FitBoxToText','on'); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I8), title('Modified Histogram'), axis square;

%SUBTRACT 128

x = 0:255;
y = x-128;
ind = find(y<0);
y(ind) = 0;
I9 = imsubtract(I7,128);
figure, subplot(2,5,1), imshow(I7), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I9 = I7-128'), axis square;
subplot(2,5,5), imshow(I9), title('I7-128'); 
subplot(2,5,6), imhist(I7), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I7(:)),"Original max: "+max(I7(:)),"Original mean: "+mean(I7(:))," ","Modified min: "+min(I9(:)),"Modified max: "+max(I9(:)),"Modified mean: "+mean(I9(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I9), title('Modified Histogram'), axis square;

%MULTIPlY BY 2

x = 0:255;
y = x*2;
ind = y>255;
y(ind) = 255;

I10 = immultiply(I7,2);
figure, subplot(2,5,1), imshow(I7), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I10 = I7*2'), axis square;
subplot(2,5,5), imshow(I10), title('I7*2'); 
subplot(2,5,6), imhist(I7), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I7(:)),"Original max: "+max(I7(:)),"Original mean: "+mean(I7(:))," ","Modified min: "+min(I10(:)),"Modified max: "+max(I10(:)),"Modified mean: "+mean(I10(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1] ,'FitBoxToText','on'); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I10), title('Modified Histogram'), axis square;

%DIVIDE BY 2

x = 0:255;
y = x/2;

I11 = imdivide(I7,2); 
figure, subplot(2,5,1), imshow(I7), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I11 = I7/2'), axis square;
subplot(2,5,5), imshow(I11), title('I7/2'); 
subplot(2,5,6), imhist(I7), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I7(:)),"Original max: "+max(I7(:)),"Original mean: "+mean(I7(:))," ","Modified min: "+min(I11(:)),"Modified max: "+max(I11(:)),"Modified mean: "+mean(I11(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I11), title('Modified Histogram'), axis square;

%NEGATIVE IMAGE

x = 0:255;
y = 255-x;

I12 = imcomplement(I7);

figure, subplot(2,5,1), imshow(I7), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function'), axis square;
subplot(2,5,5), imshow(I12), title('Negative image'); 
subplot(2,5,6), imhist(I7), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I7(:)),"Original max: "+max(I7(:)),"Original mean: "+mean(I7(:))," ","Modified min: "+min(I12(:)),"Modified max: "+max(I12(:)),"Modified mean: "+mean(I12(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I12), title('Modified Histogram'), axis square;

%-----------------------------------------------------------------------------------------

I13 = imread('A2.tif'); 
if(size(I13,3) == 3)
    I13 = rgb2gray(I13);
end

%ADD 128

I14 = imadd(I13,128);

x = 0:255;
y = x+128;
ind = find(y>255);
y(ind) = 255;

figure, subplot(2,5,1), imshow(I13), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I14 = I13+128'), axis square;
subplot(2,5,5), imshow(I14), title('I13+128');
subplot(2,5,6), imhist(I13), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I13(:)),"Original max: "+max(I13(:)),"Original mean: "+mean(I13(:))," ","Modified min: "+min(I14(:)),"Modified max: "+max(I14(:)),"Modified mean: "+mean(I14(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I14), title('Modified Histogram'), axis square;

%SUBTRACT 128

x = 0:255;
y = x-128;
ind = find(y<0);
y(ind) = 0;
I15 = imsubtract(I13,128);
figure, subplot(2,5,1), imshow(I13), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I15 = I13-128'), axis square;
subplot(2,5,5), imshow(I15), title('I13-128'); 
subplot(2,5,6), imhist(I13), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I13(:)),"Original max: "+max(I13(:)),"Original mean: "+mean(I13(:))," ","Modified min: "+min(I15(:)),"Modified max: "+max(I15(:)),"Modified mean: "+mean(I15(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I15), title('Modified Histogram'), axis square;

%MULTIPlY BY 2

x = 0:255;
y = x*2;
ind = find(y>255);
y(ind) = 255;

I16 = immultiply(I13,2);
figure, subplot(2,5,1), imshow(I13), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I16 = I13*2'), axis square;
subplot(2,5,5), imshow(I16), title('I13*2'); 
subplot(2,5,6), imhist(I13), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I13(:)),"Original max: "+max(I13(:)),"Original mean: "+mean(I13(:))," ","Modified min: "+min(I16(:)),"Modified max: "+max(I16(:)),"Modified mean: "+mean(I16(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I16), title('Modified Histogram'), axis square;

%DIVIDE BY 2

x = 0:255;
y = x/2;

I17 = imdivide(I13,2); 
figure, subplot(2,5,1), imshow(I13), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I17 = I13/2'), axis square;
subplot(2,5,5), imshow(I17), title('I13/2'); 
subplot(2,5,6), imhist(I13), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I13(:)),"Original max: "+max(I13(:)),"Original mean: "+mean(I13(:))," ","Modified min: "+min(I17(:)),"Modified max: "+max(I17(:)),"Modified mean: "+mean(I17(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1] ,'FitBoxToText','on'); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I17), title('Modified Histogram'), axis square;

%NEGATIVE IMAGE

x = 0:255;
y = 255-x;

I18 = imcomplement(I13);

figure, subplot(2,5,1), imshow(I13), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function'), axis square;
subplot(2,5,5), imshow(I18), title('Negative image'); 
subplot(2,5,6), imhist(I13), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I13(:)),"Original max: "+max(I13(:)),"Original mean: "+mean(I13(:))," ","Modified min: "+min(I18(:)),"Modified max: "+max(I18(:)),"Modified mean: "+mean(I18(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I18), title('Modified Histogram'), axis square;

%-----------------------------------------------------------------------------------------

I19 = imread('A3.tif');
if(size(I19,3) == 3) 
    I19 = rgb2gray(I19);
end

%ADD 128

I20 = imadd(I19,128);

x = 0:255;
y = x+128;
ind = find(y>255);
y(ind) = 255;

figure, subplot(2,5,1), imshow(I19), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I20 = I19+128'), axis square;
subplot(2,5,5), imshow(I20), title('I19+128');
subplot(2,5,6), imhist(I19), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I19(:)),"Original max: "+max(I19(:)),"Original mean: "+mean(I19(:))," ","Modified min: "+min(I20(:)),"Modified max: "+max(I20(:)),"Modified mean: "+mean(I20(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I20), title('Modified Histogram'), axis square;

%SUBTRACT 128

x = 0:255;
y = x-128;
ind = find(y<0);
y(ind) = 0;
I21 = imsubtract(I19,128);
figure, subplot(2,5,1), imshow(I19), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I21 = I19-128'), axis square;
subplot(2,5,5), imshow(I21), title('I19-128'); 
subplot(2,5,6), imhist(I19), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I19(:)),"Original max: "+max(I19(:)),"Original mean: "+mean(I19(:))," ","Modified min: "+min(I21(:)),"Modified max: "+max(I21(:)),"Modified mean: "+mean(I21(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I21), title('Modified Histogram'), axis square;

%MULTIPlY BY 2

x = 0:255;
y = x*2;
ind = find(y>255);
y(ind) = 255;

I22 = immultiply(I19,2);
figure, subplot(2,5,1), imshow(I19), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I22 = I19*2'), axis square;
subplot(2,5,5), imshow(I22), title('I19*2'); 
subplot(2,5,6), imhist(I19), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I19(:)),"Original max: "+max(I19(:)),"Original mean: "+mean(I19(:))," ","Modified min: "+min(I22(:)),"Modified max: "+max(I22(:)),"Modified mean: "+mean(I22(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I22), title('Modified Histogram'), axis square;

%DIVIDE BY 2

x = 0:255;
y = x/2;

I23 = imdivide(I19,2); 
figure, subplot(2,5,1), imshow(I19), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function: I23 = I19/2'), axis square;
subplot(2,5,5), imshow(I23), title('I19/2'); 
subplot(2,5,6), imhist(I19), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I19(:)),"Original max: "+max(I19(:)),"Original mean: "+mean(I19(:))," ","Modified min: "+min(I23(:)),"Modified max: "+max(I23(:)),"Modified mean: "+mean(I23(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1],'FitBoxToText','on' ); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I23), title('Modified Histogram'), axis square;

% NEGATIVE IMAGE

x = 0:255;
y = 255-x;

I24 = imcomplement(I19);

figure, subplot(2,5,1), imshow(I19), title('Original');
subplot(2,5,3), plot(x,y,'LineWidth', 3), axis([0 255 0 255]), title('Transformation function'), axis square;
subplot(2,5,5), imshow(I24), title('Negative image'); 
subplot(2,5,6), imhist(I19), title('Original Histogram'), axis square;
annotation('textbox',[0.40, 0.20, 0.13, 0.2],'Color',[1 0 0],'String',{"Original min: "+min(I19(:)),"Original max: "+max(I19(:)),"Original mean: "+mean(I19(:))," ","Modified min: "+min(I24(:)),"Modified max: "+max(I24(:)),"Modified mean: "+mean(I24(:))},...
    'FontSize',10,'BackgroundColor',[1 1 1] ,'FitBoxToText','on'); 
annotation('textbox',[0.494613095238095 0.418391330356418 0.0536458344571292 0.0357905988255118],'Color',[0 0 0],'String',"Statistics",...
    'FontWeight','bold','FontSize',11,'EdgeColor',[0.941176470588235 0.941176470588235 0.941176470588235]); 
subplot(2,5,10), imhist(I24), title('Modified Histogram'), axis square;
