clc;clear all;
load('F:\12_glider\sla.mat')
load('F:\12_glider\eddy_centre_coordinates.mat')
load('F:\12_glider\glider\1000K005.mat')
load('F:\12_glider\glider\1000K003.mat')
load('F:\12_glider\glider\1000K008.mat')
load('F:\12_glider\glider\1000J008.mat')
load('F:\12_glider\glider\1000K004.mat')
load('F:\12_glider\glider\1000K007.mat')
load('F:\12_glider\glider\1000J005.mat')
load('F:\12_glider\glider\1000J003.mat')
load('F:\12_glider\glider\1000J007.mat')
load('F:\12_glider\glider\300K004.mat')
load('F:\12_glider\glider\300K003.mat')
load('F:\12_glider\glider\300K001.mat')


for i=1:length(sla_time);
sla_time1{i}=datestr(sla_time(i),'yyyy.mm.dd');
end
sla_time1=sla_time1';

[x1,y1]=meshgrid(sla_lon,sla_lat);
x1=x1'; y1=y1';


%%  DAY
load('K:\数据与程序\colormap\colormap_1\colormap\GMT_polar.mat')
k=15;


for i=46%    53    60    67
figure
load('K:\数据与程序\colormap\colormap_1\colormap\MPL_jet.mat')
pcolor(x1,y1,sla_adt(:,:,i))
colorbar
hc=colorbar
caxis([1.0 1.3])
shading interp
hold on
hold on
quiver(x1,y1,sla_u(:,:,i)./2,sla_v(:,:,i)./2,0,'color',[.4 .4 .4],'LineWidth',1.5,'MaxHeadSize',0.1)
hold on
quiver(120.5,22.8,0.5/2,0,0,'color','k','LineWidth',1.5,'maxheadsize',1)
text(120.5,22.7,'0.5m/s','FontAngle','italic','Fontsize',12,'rotation',0,'Color','k')
hold on
plot(K300K001_lon,K300K001_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K300K003_lon,K300K003_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K300K004_lon,K300K004_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000J003_lon,K1000J003_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000J005_lon,K1000J005_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000J007_lon,K1000J007_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000J008_lon,K1000J008_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000K003_lon,K1000K003_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000K004_lon,K1000K004_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000K005_lon,K1000K005_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000K007_lon,K1000K007_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
hold on
plot(K1000K008_lon,K1000K008_lat,'-','Color',[1 0 1],'markersize',8,'LineWidth',3)
axis square
set(gcf,'outerposition',get(0,'screensize'));
xlim([117 121]);ylim([19 24]);
axis square
axis([117 121 19 23]);
set(gca,'ytick',19:1:24);
set(gca,'xtick',117:1:121);
set(gca,'linewidth',3,'box','on','tickdir','in','fontsize',35)
tile=[sla_time1{i},' ','ADT']
title(tile,'fontsize',25)
hold on
plot(eddy_longitude(k),eddy_latitude(k),'p','color','k','markersize',25,'linewidth',3)
hold on
ttt=0:360
xx1=eddy_longitude(k)+(eddy_effective_radius(k)/1.11*sin(ttt/360*2*pi));
yy1=eddy_latitude(k)+(eddy_effective_radius(k)/1.11*cos(ttt/360*2*pi));
hold on
plot(xx1,yy1,'color','k','linewidth',3);
hold on
plot(xx1/2,yy1/2,'color','k','linewidth',3);
hold on
title(tile,'fontsize',25)

hold on
set(gcf,'color','w')

end
k=k+7;
colormap(nclCM(80))


