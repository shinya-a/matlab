function[h_quiver,h_contour,h_annot]=  createvplot4(XData1,YData1,XData2,YData2,UData2,VData2,zdata2,scale,annot_str, title1,Cmin,Cmax, colmap, xsize,ysize,xmin,xmax,ymin,ymax)
%CREATEFIGURE(ZDATA1,YDATA1,XDATA1,CDATA1,ZDATA2)
%  ZDATA1:  surface zdata
%  YDATA1:  surface ydata
%  XDATA1:  surface xdata
%  CDATA1:  surface cdata
%  ZDATA2:  contour z

%  MATLAB による自動生成日: 29-Mar-2013 19:17:25

% figure を作成
figure1 = figure('PaperSize',[20 30],...
    'Color',[1 1 1],...
    'Colormap',colmap,...
    'OuterPosition',[0 0 xsize ysize]);

dx=xmax-xmin;
dy=ymax-ymin;
for i=0:10
    interval = 10^i;
    if(min(dx/10^i,dy/10^i)<10)
        break
    end
end  

% axes を作成
axes1 = axes('Parent',figure1,...
    'YTick', ymin:interval:ymax,...
    'XTick', xmin:interval:xmax,...
    'FontSize',9,...
    'FontName','Arial',...
    'CLim',[Cmin Cmax],...
    'Box','on');
% Axes の X 軸の範囲を保持するために以下のラインのコメントを解除
%xlim(axes1,[-25 3125]);
 xlim(axes1,[xmin xmax]);
% Axes の Y 軸の範囲を保持するために以下のラインのコメントを解除
%ylim(axes1,[-25 9525]);
 ylim(axes1,[ymin ymax]);
hold(axes1,'all');
pbaspect([dx dy 1])


% surface を作成

% colorbar を作成
%colormap(colmap);
colorbar('peer',axes1);

% legend を作成
%legend1 = legend(axes1,'show');
%set(legend1,...
%    'Position',[0.639718343275489 0.246688741721854 0.186550976138829 0.0213392200147167]);
%shading interp

% contour を作成
h_contour=contour(XData1,YData1,zdata2,...
    'LevelList',[0 0.2 0.5 3],...
    'LevelList',[0 0.5 1 3],...
    'Parent',axes1,...
    'ShowText','off');

%    'LevelList',[0 0.25 0.5 1 3 5],...
%    'LevelList',[-1 1],...

% quiver を作成
Z=hypot(UData2,VData2);
U=UData2*scale;
V=VData2*scale;
h_quiver=vfield(XData2,YData2,U,V,Z,...
    'fill',1,...
    'tr',0.2);

% xlabel を作成
xlabel('X (km)','FontName','Arial');

% ylabel を作成
ylabel('Y (km)','FontName','Arial');

% title を作成
title(title1,'FontSize',13,'FontName','Arial', 'FontWeight', 'normal');


% textbox を作成
h_annot=annotation(figure1,'textbox',...
    [0 0.01 0.9 0.035],...
    'HorizontalAlignment', 'center',...
    'String',annot_str,...
    'FontName','Arial',...
    'FontSize',13,...
    'FitBoxToText','on',...
    'LineStyle','none');



