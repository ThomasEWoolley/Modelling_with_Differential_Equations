ccc

figure('units','normalized','position',[0 0 1 1])
[X,Y] = meshgrid(-2:.02:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,.2,.2);


contour(X,Y,Z,'linewidth',3)
[X,Y] = meshgrid(-2:.2:2);
Z = X.*exp(-X.^2 - Y.^2);
[DX,DY] = gradient(Z,.2,.2);
hold on
quiver(X,Y,DX,DY,'linewidth',2,'autoscalefactor',0.7)
hold off
axis off
export_fig '../Pictures/Front_image.png' -m3