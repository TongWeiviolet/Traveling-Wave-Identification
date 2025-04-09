clear
clc

X = 0 : 0.1 : 5;
Y = 0 : 0.1 : 10;

% standing wave
sigma = 0.8;
[ XX, YY ] = meshgrid( X, Y );
Z1 = exp(-(( XX - 2.5 ).^2 + ( YY - 5 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 2.5 ).^2 + ( YY - 5 ).^2)./( 2 * sigma^2 ));
omega1 = pi/15; 
T = 200;
A(:,:,1) = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A(:,:,2) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));
[U,~,~] = dualsvd(A,1);

figure;
subplot(1,2,1);
imagesc(reshape(U(:,1,1),101,51));
colorbar();
colormap(jet);
title('U_s(:,1)');
set(gca,'FontSize',15);
subplot(1,2,2);
imagesc(reshape(U(:,1,2),101,51));
colorbar();
colormap(jet);
title('U_i(:,1)');
set(gca,'FontSize',15);
sgtitle('Standing Wave','FontSize',20);



X = 0 : 0.1 : 5;
Y = 0 : 0.1 : 10;

% traveling wave
sigma = 0.8;
[ XX, YY ] = meshgrid( X, Y );
Z1 = exp(-(( XX - 2.5 ).^2 + ( YY - 2 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 2.5 ).^2 + ( YY - 8 ).^2)./( 2 * sigma^2 ));
omega1 = pi/15; 
T = 200;
A(:,:,1) = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A(:,:,2) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));
[U,~,~] = dualsvd(A,2);

figure;
subplot(2,2,1);
imagesc(reshape(U(:,1,1),101,51));
colorbar();
colormap(jet);
title('U_s(:,1)');
set(gca,'FontSize',15);
subplot(2,2,3);
imagesc(reshape(U(:,1,2),101,51));
colorbar();
colormap(jet);
title('U_i(:,1)');
set(gca,'FontSize',15);
subplot(2,2,2);
imagesc(reshape(U(:,2,1),101,51));
colorbar();
colormap(jet);
title('U_s(:,2)');
set(gca,'FontSize',15);
subplot(2,2,4);
imagesc(reshape(U(:,2,2),101,51));
colorbar();
colormap(jet);
title('U_i(:,2)');
set(gca,'FontSize',15);
sgtitle('Traveling Wave','FontSize',20);