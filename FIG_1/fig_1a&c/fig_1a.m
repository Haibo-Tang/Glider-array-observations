
load('fig_1a.mat')

figure
m_proj('Equidistant Cylindrical','lon',[117 121],'lat',[19 23.5]); 
shading interp
hold on
m_pcolor(x3,y3,depth)
colormap (cmp_haxby)
shading interp
caxis([-5000 0])
h=colorbar
set(h,'fontsize',25,'ytick',-5000:1000:0);
set(get(h,'Title'),'position',[15 -24],'fontsize',20)%,'string','Depth'
hold on
set(gca,'linewidth',0.5,'box','on','fontsize',20)
m_gshhs_h('color','k')
m_grid('linest','none','linewidth',2,'tickdir','in','tickstyle','dd','backcolor',[0.700 0.700 0.700],'fontsize',35); %边框及网格设定
m_gshhs('lc1','patch',[0.7 .7 .7],'edgecolor','none');
hold on
[cs,h]=m_contour(x3,y3,z_topo1,[-200 -500 -1000],'color',[.4 .4 .4],'showtext','off','LineWidth',0.2)
clabel(cs,h,'manual','FontSize',13','FontWeight','bold','rotation',0);

for i=1;
hold on
m_plot(K300K001_lon,K300K001_lat,'-','Color',[0 0.39 0],'markersize',8,'linewidth',2.5)
%m_plot(119.2,22.09,'p','color','b')
m_text(119.3,22.09,'300K001','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0 0.39 0])
hold on
m_plot(K300K003_lon,K300K003_lat,'-','Color',[0 0.39 0],'markersize',8,'linewidth',2.5)
%m_plot(118.4,21.55,'p','color','b')
m_text(118.4,21.55,'300K003','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0 0.39 0])
hold on
m_plot(K300K004_lon,K300K004_lat,'-','Color',[0 0.39 0],'markersize',8,'linewidth',2.5)
%m_plot(117.6,21.25,'p','color','b')
m_text(117.6,21.25,'300K004','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0 0.39 0])
hold on
m_plot(K1000J003_lon,K1000J003_lat,'-','Color',[255,0,0]/255,'markersize',8,'linewidth',2.5)
%m_plot(119.4,21.75,'p','color','b')
m_text(119.4,21.75,'1000J003','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[255,0,0]/255)
hold on
m_plot(K1000J005_lon,K1000J005_lat,'-','Color',[255,0,0]/255,'markersize',8,'linewidth',2.5)
%m_plot(119.6,21.49,'p','color','b')
m_text(119.6,21.49,'1000J005','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[255,0,0]/255)
hold on
m_plot(K1000J007_lon,K1000J007_lat,'-','Color',[255,0,0]/255,'markersize',8,'linewidth',2.5)
%m_plot(119.8,21.19,'p','color','b')
m_text(119.8,21.19,'1000J007','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[255,0,0]/255)
hold on
m_plot(K1000J008_lon,K1000J008_lat,'-','Color',[255,0,0]/255,'markersize',8,'linewidth',2.5)
%m_plot(120.1,20.89,'p','color','b')
m_text(120.1,20.89,'1000J008','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[255,0,0]/255)
hold on
m_plot(K1000K003_lon,K1000K003_lat,'-','Color',[0,0,255]/255,'markersize',8,'linewidth',2.5)
%m_plot(119.6,20.55,'p','color','b')
m_text(119.6,20.55,'1000K003','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0,0,255]/255)
hold on
m_plot(K1000K004_lon,K1000K004_lat,'-','Color',[0,0,255]/255,'markersize',8,'linewidth',2.5)
%m_plot(119,20.15,'p','color','b')
m_text(119,20.15,'1000K004','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0,0,255]/255)
hold on
m_plot(K1000K005_lon,K1000K005_lat,'-','Color',[0,0,255]/255,'markersize',8,'linewidth',2.5)
%m_plot(119.2,20.35,'p','color','b')
m_text(119.2,20.35,'1000K005','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0,0,255]/255)
hold on
m_plot(K1000K007_lon,K1000K007_lat,'-','Color',[0,0,255]/255,'markersize',8,'linewidth',2.5)
%m_plot(118.6,19.9,'p','color','b')
m_text(118.6,19.9,'1000K007','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0,0,255]/255)
hold on
m_plot(K1000K008_lon,K1000K008_lat,'-','Color',[0,0,255]/255,'markersize',8,'linewidth',2.5)
%m_plot(119.9,20.76,'p','color','b')
m_text(119.9,20.76,'1000K008','FontAngle','italic','Fontsize',20,'rotation',0,'Color',[0,0,255]/255)
end

hold on
m_text(117.5,23,'Taiwan Strait','FontAngle','normal','Fontsize',30,'rotation',0,'Color',[.41 .41 .41])

hold on
m_text(120.5,20,'Luzon Strait','FontAngle','normal','Fontsize',30,'rotation',90,'Color',[.41 .41 .41])

%% glider hotmap%%%%%%%%%%%%%%%%%%%%%%%%%
X=cat(2,K300K001_lon,K300K003_lon,K300K004_lon,K1000J003_lon,K1000J005_lon,K1000J007_lon,K1000J008_lon,...
    K1000K003_lon,K1000K004_lon,K1000K005_lon,K1000K007_lon,K1000K008_lon)';
Y=cat(2,K300K001_lat,K300K003_lat,K300K004_lat,K1000J003_lat,K1000J005_lat,K1000J007_lat,K1000J008_lat,...
    K1000K003_lat,K1000K004_lat,K1000K005_lat,K1000K007_lat,K1000K008_lat)';
figure
binscatter(X,Y,[50 50])
colormap(sunshine_9lev(2:10,:))
caxis([0 120])
c=colorbar;
set(c,'tickdir','out')  
set(c,'YTick',0:40:120); 
set(get(c,'ylabel'),'string','Counts','fontsize',35);
defualtAxes
