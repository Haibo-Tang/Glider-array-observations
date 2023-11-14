clear all;clc;
load('F:\12_glider\FIG_6\gliderdata_grid.mat');
load('F:\12_glider\wind.mat')


for i=1:length(x1);
time_new2{i}=datestr(x1(i),'yyyy.mm.dd.hh');
end
time_new2=time_new2';
  
for i = 1:length(x1)
    aa = abs(x1(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = 120;
    lat_glider(i) = 20;
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)) %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)) %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)) %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)) %j2为数据北边界索引
    area_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    area_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
    area_tp(i)=nanmean(nanmean(wind_tp(i1:i2,j2:j1,ii)));;
    area_usurf(i)=nanmean(nanmean(wind_usurf(i1:i2,j2:j1,ii)));;
    area_ep(i)=nanmean(nanmean(wind_evaporation(i1:i2,j2:j1,ii)));;
end

x1_1h=(x1(1):1/24:x1(end));
for i = 1:length(x1_1h)
    aa = abs(x1_1h(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = 120;
    lat_glider(i) = 20;
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    area_qsurf_1h(i)=nanmean(nanmean(wind_qsurf(i1:i2,j2:j1,ii)));;
    area_mslhf_1h(i)=nanmean(nanmean(wind_mslhf(i1:i2,j2:j1,ii)));;
    area_msnlwrf_1h(i)=nanmean(nanmean(wind_msnlwrf(i1:i2,j2:j1,ii)));;
    area_msnswrf_1h(i)=nanmean(nanmean(wind_msnswrf(i1:i2,j2:j1,ii)));;
    area_msshf_1h(i)=nanmean(nanmean(wind_msshf(i1:i2,j2:j1,ii)));;
end

n=1:length(area_qsurf_1h);n=n';
for i=1:length(area_qsurf_1h)
    m=find(n>=i-12& n<=i+12);
    area_qsurf_24h(i)=nanmean(area_qsurf_1h(m));
    area_msshf_24h(i)=nanmean(area_msshf_1h(m));
end

for i = 1:length(x1)
    uv_wind(i) = sqrt(area_u10(i).^2+area_v10(i).^2);
end

for t = 1:length(x1)
    if uv_wind(t) < 11
        Cd = 1.2*10^-3;
        ustress(t) = 1.293*Cd*uv_wind(t)*area_u10(t);
        vstress(t) = 1.293*Cd*uv_wind(t)*area_v10(t);
    elseif uv_wind(t) >= 11 && uv_wind(t) < 25
        Cd = (0.49+0.065*uv_wind(t))*10^-3;
        ustress(t) = 1.293*Cd*uv_wind(t)*area_u10(t);
        vstress(t) = 1.293*Cd*uv_wind(t)*area_v10(t);
    elseif uv_wind(t) >= 25
        Cd = 2.115*10^-3;
        ustress(t) = 1.293*Cd*uv_wind(t)*area_u10(t);
        vstress(t) = 1.293*Cd*uv_wind(t)*area_v10(t);
    end
    clear Cd
end
clear uv_wind

dens_new2 = sw_pden(salt_new2,temp_new2,sw_pres(dept_new2,lat_new2),0);
EP=area_tp+area_ep;

area_alpha_beta=sw_aonb(salt_new2,temp_new2,dept_new2,'temp');
area_alpha_beta1=nanmean(nanmean(area_alpha_beta(1:50,:),1));
area_cp=sw_cp(salt_new2,temp_new2,dept_new2);        
area_cp1=nanmean(nanmean(area_cp(1:50,:),1));

Q_ep=nanmean(nanmean(dens_new2,1)).*4000.*(7.8*10^-4).*(salt_new2(15,:)).*EP./5.7;
area_qsurf=interp1(x1_1h,area_qsurf_24h,x1);
area_qsurf(end)=area_qsurf(end-1);
Q_net=Q_ep+area_qsurf;

%% plot fig
tick_fontsize=18;
string_fontsize=14
gca_linewidth=2;
gca_fontsize=18;
colorbar_fontsize=12;

%% （1) QNET_four_compnent
clear time_tick time_tick1 time_tick_lable time_tick_lable1
time_tick=datenum(2017,07,15,0,0,0):datenum(2017,08,13,0,0,0);
time_tick1=(time_tick(1):4:time_tick(end));
time_tick_lable= datevec(time_tick1);
time_tick_lable1= strcat(num2str(time_tick_lable(:,2)),'/',num2str(time_tick_lable(...
    :,3),'%02d'));
fontsize_size=25;
linewidth_size=3;
for i=2
figure
h1=plot(x1_1h,area_mslhf_1h,'LineWidth',2,'color',[.23 0.70 0.44])
hold on
h2=plot(x1_1h,area_msnlwrf_1h,'LineWidth',2,'color',[.73 0.56 0.56])
hold on
h3=plot(x1_1h,area_msnswrf_1h,'LineWidth',2,'color',[1 0.64 0])
hold on
h4=plot(x1_1h,area_msshf_1h,'LineWidth',2,'color',[.27 0.50 0.70])
set(gca,'xtick',time_tick1,'xlim',[time_tick(1) time_tick(end)],'xticklabel', ...
time_tick_lable1,'XTickLabelRotation',0,'tickdir','in','XAxisLocation','bottom');%
box on
set(gca,'linewidth',3,'box','on','fontsize',25)

ylim([-400 1000])
set(gca,'ytick',(-400:400:1000))
set(gcf,'position',[400 302 560*2.5 420*1]);
hold on
yy=zeros(length(x1));
plot(x1,yy,'LineWidth',1.5,'color','k')
hold on
h6=plot(x1_1h,area_qsurf_24h,'LineWidth',3,'color','k')
hold on
h5=plot(x1_1h,area_qsurf_1h,':','LineWidth',1.5,'color','k')
set(gca,'linewidth',linewidth_size,'box','on','fontsize',fontsize_size)
hold on
H_pa = patch([x1(296),x1(296),x1(418),x1(418)],[-1000 1000,1000,-1000],[192,192,192]/255);
set(H_pa,'EdgeColor',[192,192,192]/255,'EdgeAlpha',0.3,'FaceAlpha',0.5,'linewidth',3)
legend([h1,h2,h3,h4,h5,h6],{'Q_{shortwave}','Q_{longtwave}',...
    'Q_{latent}','Q_{sensible}','Q_{NSHF}','Q_{NSHF(24h-mean)}'},'fontsize',20,'NumColumns',5)
set(gca,'Position',[0.1385    0.4060    0.6375    0.4371]);
end
ylabel('Heat flux [W/m^{2}] ','fontsize',20);

%% （2） net water flux and net het flux
Qnet_loss=Q_ep+area_qsurf;
Qnet_get=Q_ep+area_qsurf;
Qnet_loss(Qnet_loss>0)=0;
Qnet_get(Qnet_get<0)=0;
fillx=[x1,fliplr(x1)];
N1=length(x1);
yFill1 = [Qnet_loss,ones(1,N1)*0];
yFill2 = [Qnet_get,ones(1,N1)*0];

for i=1
figure
h1=plot(x1,Q_ep,'LineWidth',4,'color',[.23 0.80 0.24])
hold on
h2=plot(x1,area_qsurf,'LineWidth',4,'color',[1 0.64 0])
hold on
h3=plot(x1,Q_ep+area_qsurf,'LineWidth',1.5,'color','k')
set(gca,'xtick',time_tick1,'xlim',[time_tick(1) time_tick(end)],'xticklabel', ...
time_tick_lable1,'XTickLabelRotation',0,'tickdir','in','XAxisLocation','bottom');%
box on
set(gca,'linewidth',3,'box','on','fontsize',25)
ylim([-300 300])
set(gca,'ytick',(-300:100:300))
set(gcf,'position',[400 302 560*2.5 420*1]);
hold on
yy=zeros(length(x1));
plot(x1,yy,'LineWidth',2,'color','k')
grid on
set(gca,'GridLineStyle','-.','GridColor',[.8 .8 .8],'GridAlpha',0.5)
set(gca,'linewidth',linewidth_size,'box','on','fontsize',fontsize_size)
set(gca,'Position',[0.1385    0.4060    0.6375    0.4371]);
hold on
fill(fillx,yFill1,'b','edgealpha', '0', 'facealpha', '.2');
hold on;
fill(fillx,yFill2,'r','edgealpha', '0', 'facealpha', '.2');
hold on
H_pa = patch([x1(296),x1(296),x1(418),x1(418)],[-1000 1000,1000,-1000],[192,192,192]/255);
set(H_pa,'EdgeColor',[192,192,192]/255,'EdgeAlpha',0.3,'FaceAlpha',0.5,'linewidth',3)
legend([h1,h2,h3],{'Q_{P-E}','Q_{NSHF(24h-mean)}',...
    'Q_{total}'},'fontsize',25,'NumColumns',5)
end
ylabel('Heat flux [W/m^{2}] ','fontsize',20);

%% wind%%%%%%%%%%%%%%
figure
%subplot(2,2,1)
h1=plot(x1,sqrt(ustress.^2+vstress.^2),'LineWidth',3,'color','k')
set(gca,'xtick',time_tick1,'xlim',[time_tick(1) time_tick(end)],'xticklabel', ...
time_tick_lable1,'XTickLabelRotation',0,'tickdir','in','XAxisLocation','bottom');%
box on
set(gca,'linewidth',3,'box','on','fontsize',25)
ylim([0 1])
set(gca,'ytick',(0:0.2:1))
set(gcf,'position',[400 302 560*2.5 420*1]);
%grid on
%set(gca,'GridLineStyle','-.','GridColor',[.8 .8 .8],'GridAlpha',0.5)
set(gca,'linewidth',linewidth_size,'box','on','fontsize',fontsize_size)
set(gca,'Position',[0.1385    0.4060    0.6375    0.4371]);
hold on
H_pa = patch([x1(296),x1(296),x1(418),x1(418)],[-1000 1000,1000,-1000],[192,192,192]/255);
set(H_pa,'EdgeColor',[192,192,192]/255,'EdgeAlpha',0.3,'FaceAlpha',0.5,'linewidth',3)
%ylabel('Wind stress [\tau] ','fontsize',20);
ylabel('Wind stress [N/m^{2}] ','fontsize',20);

