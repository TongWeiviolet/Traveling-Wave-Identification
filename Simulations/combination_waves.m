clear
clc

X = 0 : 0.1 : 20;
Y = 0 : 0.1 : 20;
sigma = 1;
[ XX, YY ] = meshgrid( X, Y );
T = 200;

% wave 1
Z1 = exp(-(( XX - 5 ).^2 + ( YY - 5 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 5 ).^2 + ( YY - 5 ).^2)./( 2 * sigma^2 ));
omega1 = pi/10; 
C1 = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A1(:,:) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));

% wave 2
Z1 = exp(-(( XX - 10 ).^2 + ( YY - 10 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 10 ).^2 + ( YY - 10 ).^2)./( 2 * sigma^2 ));
omega1 = pi/13; 
C2 = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A2(:,:) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));

% wave 3
Z1 = exp(-(( XX - 15 ).^2 + ( YY - 7 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 15 ).^2 + ( YY - 7 ).^2)./( 2 * sigma^2 ));
omega1 = pi/17; 
C3 = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A3(:,:) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));

% wave 4
Z1 = exp(-(( XX - 17 ).^2 + ( YY - 18 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 17 ).^2 + ( YY - 18 ).^2)./( 2 * sigma^2 ));
omega1 = pi/20; 
C4 = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A4(:,:) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));

% wave 5
Z1 = exp(-(( XX - 5 ).^2 + ( YY - 10 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 10 ).^2 + ( YY - 5 ).^2)./( 2 * sigma^2 ));
omega1 = pi/45; 
C5 = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A5(:,:) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));

% wave 6
Z1 = exp(-(( XX - 7 ).^2 + ( YY - 15 ).^2)./( 2 * sigma^2 ));
Z2 = exp(-(( XX - 12 ).^2 + ( YY - 15 ).^2)./( 2 * sigma^2 ));
omega1 = pi/50; 
C6 = (Z1(:)*cos(omega1.*(1:T))-Z2(:)*sin(omega1.*(1:T))).*2;
A6(:,:) = 2.*(-omega1.*Z1(:)*sin(omega1.*(1:T)) - omega1.*Z2(:)*cos(omega1.*(1:T)));

C = C1 .* 0.9 + C2 .* 0.8 + C3 .* 0.7 + C4 .* 0.6 + C5 .* 0.2 + C6 .* 0.1;
CC = C + randn(size(C)) .* 1e-3;
A(:,:,1) = CC(:,1:198);
A(:,:,2) = (-3.*CC(:,1:198) + 4.*CC(:,2:199)- CC(:,3:200))./2;
[U,~,~] = dualsvd(A,8);

figure;
for i = 1:4
    subplot(2,4,i);
    imagesc(reshape(U(:,i,1),201,201));
    axis square
    colorbar();
    colormap(jet);
    title(['U_s(:,',num2str(i),')'],'FontSize',17);
    set(gca,'FontSize',17);
end
for i = 5:8
    subplot(2,4,i);
    imagesc(reshape(U(:,i-4,2),201,201));
    axis square
    colorbar();
    colormap(jet);
    title(['U_i(:,',num2str(i-4),')'],'FontSize',17);
    set(gca,'FontSize',17);
end
figure;
for i = 1:4
    subplot(2,4,i);
    imagesc(reshape(U(:,i+4,1),201,201));
    axis square
    colorbar();
    colormap(jet);
    title(['U_s(:,',num2str(i+4),')'],'FontSize',17);
    set(gca,'FontSize',17);
end
for i = 5:8
    subplot(2,4,i);
    imagesc(reshape(U(:,i,2),201,201));
    axis square
    colorbar();
    colormap(jet);
    title(['U_i(:,',num2str(i),')'],'FontSize',17);
    set(gca,'FontSize',17);
end