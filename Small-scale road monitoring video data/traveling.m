clear
clc

%% Numerical Experiments
% traveling wave identification in small-scale road monitoring video data

% step 1: construct dual matrices
load('road_monitoring_video_data.mat');
Aa(:,:,1) = A(:,1:130);
Aa(:,:,2) = (- 3 .*A(:,1:130) + 4 .* A(:,2:131) - A(:,3:132))./2;

% step 2: calculate CDSVD
[U,S,V] = dualsvd(Aa,20);

% step 3: calculate inner products
M = 20;
angle = zeros(M,M);
for x = 1:M
    for y = 1:M
        angle(x,y) = U(:,x,1)'*U(:,y,2)/(norm(U(:,x,1))*norm(U(:,y,2)));
    end
end
figure;
imagesc(angle);
colormap(jet);
colorbar();
axis square;
xlabel('U_s(:,x)');
ylabel('U_i(:,y)');
title('Inner products between vectors of U_s and U_i');
set(gca,'FontSize',25);

% step 4: identify a standing wave and a traveling wave
A1 = U(:,1,1) * S(1,1,1) * V(:,1,1)';
A23 = U(:,2:3,1) * S(2:3,2:3,1) * V(:,2:3,1)';

figure;
subplot(2,5,1);
imshow(mat2gray(reshape(A(:,1),240,320)));
title('t_1');
set(gca,'FontSize',15);
subplot(2,5,2);
imshow(mat2gray(reshape(A(:,20),240,320)));
title('t_2');
set(gca,'FontSize',15);
subplot(2,5,3);
imshow(mat2gray(reshape(A(:,40),240,320)));
title('t_3');
set(gca,'FontSize',15);
subplot(2,5,4);
imshow(mat2gray(reshape(A(:,70),240,320)));
title('t_4');
set(gca,'FontSize',15);
subplot(2,5,5);
imshow(mat2gray(reshape(A(:,130),240,320)));
title('t_5');
set(gca,'FontSize',15);
sgtitle('Original frames','FontSize',20);

figure;
subplot(2,5,1);
imshow(mat2gray(reshape(A23(:,1),240,320)));
title('t_1');
set(gca,'FontSize',15);
subplot(2,5,2);
imshow(mat2gray(reshape(A23(:,20),240,320)));
title('t_2');
set(gca,'FontSize',15);
subplot(2,5,3);
imshow(mat2gray(reshape(A23(:,40),240,320)));
title('t_3');
set(gca,'FontSize',15);
subplot(2,5,4);
imshow(mat2gray(reshape(A23(:,70),240,320)));
title('t_4');
set(gca,'FontSize',15);
subplot(2,5,5);
imshow(mat2gray(reshape(A23(:,130),240,320)));
title('t_5');
set(gca,'FontSize',15);
sgtitle('Traveling wave identification','FontSize',20);

% step 5: videos of  the standing wave and the traveling wave
% original video
myObj = VideoWriter('original.avi');
myObj.FrameRate = 20;
open(myObj);
for i = 1:130
    writeVideo(myObj,mat2gray(reshape(A(:,i),240,320)));
end
close(myObj);

% video with the first PC
myObj = VideoWriter('1_PC_standing_wave.avi');
myObj.FrameRate = 20;
open(myObj);
for i = 1:130
    writeVideo(myObj,mat2gray(reshape(A1(:,i),240,320)));
end
close(myObj);

% video with the second and thirs PCs
myObj = VideoWriter('2+3_PCs_traveling_wave.avi');
myObj.FrameRate = 20;
open(myObj);
for i = 1:130
    writeVideo(myObj,mat2gray(reshape(A23(:,i),240,320)));
end
close(myObj);