aim_eddy_area=[-1.3 1.3;-1.3 1.3]
lon_lat_inter=0.1;
[eddx,eddy]=meshgrid(aim_eddy_area(1,1):lon_lat_inter:aim_eddy_area(1,2),aim_eddy_area(2,1):lon_lat_inter:aim_eddy_area(2,2));
[M, N]=size(eddx);
eddy_numbe_GI=zeros(M,N);
eddy_numbe_SI=zeros(M,N);
eddy_numbe_samp=zeros(M,N);
sort_value=10;


for i=1:length(K1000K003_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000K003_time_sort(i)&K1000K003_time_sort(i)<datenum(2017,8,2,0,0,0)       
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000K003_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000K003_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K003_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K003_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000K004_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000K004_time_sort(i)&K1000K004_time_sort(i)<datenum(2017,8,2,0,0,0)   
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000K004_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000K004_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K004_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K004_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000K005_SI_sort)
      if  datenum(2017,7,27,0,0,0)<K1000K005_time_sort(i)&K1000K005_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000K005_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000K005_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K005_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K005_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
      end
    clear lons lats dd
end

for i=1:length(K1000K007_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000K007_time_sort(i)&K1000K007_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000K007_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000K007_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K007_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K007_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000K008_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000K008_time_sort(i)&K1000K008_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000K008_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000K008_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K008_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000K008_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000J008_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000J008_time_sort(i)&K1000J008_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000J008_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000J008_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J008_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J008_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
    end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000J007_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000J007_time_sort(i)&K1000J007_time_sort(i)<datenum(2017,8,2,0,0,0)          
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000J007_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000J007_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J007_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J007_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000J005_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K1000J005_time_sort(i)&K1000J005_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000J005_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000J005_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J005_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J005_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K1000J003_SI_sort)
 if  datenum(2017,7,27,0,0,0)<K1000J003_time_sort(i)&K1000J003_time_sort(i)<datenum(2017,8,2,0,0,0)    
     for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K1000J003_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K1000J003_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J003_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K1000J003_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
 end
    clear lons lats dd
end

for i=1:length(K300K004_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K300K004_time_sort(i)&K300K004_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K300K004_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K300K004_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K300K004_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K300K004_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K300K003_SI_sort)
    if  datenum(2017,7,27,0,0,0)<K300K003_time_sort(i)&K300K003_time_sort(i)<datenum(2017,8,2,0,0,0)    
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K300K003_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K300K003_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K300K003_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K300K003_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
    end
    clear lons lats dd
end

for i=1:length(K300K001_SI_sort)
         if  datenum(2017,7,27,0,0,0)<K300K001_time_sort(i)&K300K001_time_sort(i)<datenum(2017,8,2,0,0,0)
    for ii=1:M% 按照行循环
        for jj=1:N
            if normalizedhorizontalcoordinate_gliderlon_K300K001_sort(i)>((jj-1)*lon_lat_inter+aim_eddy_area(1,1))...
                    &normalizedhorizontalcoordinate_gliderlon_K300K001_sort(i)<(jj)*lon_lat_inter+aim_eddy_area(1,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K300K001_sort(i)>(ii-1)*lon_lat_inter+aim_eddy_area(2,1)...
                    &normalizedhorizontalcoordinate_gliderlat_K300K001_sort(i)<(ii)*lon_lat_inter+aim_eddy_area(2,1)                
                eddy_numbe_samp(ii,jj)=eddy_numbe_samp(ii,jj)+1;
            end
        end
    end
         end
    clear lons lats dd
end

sum(sum(eddy_numbe_samp))

text_lon=aim_eddy_area(1,1)+0.05:lon_lat_inter:aim_eddy_area(1,2)-0.05;
text_lat=aim_eddy_area(2,1)+0.05:lon_lat_inter:aim_eddy_area(2,2)-0.05;
[eddxx,eddyy]=meshgrid(text_lon,text_lat);


%% plot and text number
figure
i=19;
hcs=contour(normalizedhorizontalcoordinate_fslelon_x(:,:,i),normalizedhorizontalcoordinate_fslelat_y(:,:,i),fsle_max_center(:,:,i)...
    ,[0.15 0.15],'linewidth',2,'color','k');
hold on
set(0,'defaultfigurecolor','w');
hcs=pcolor(eddx,eddy,eddy_numbe_samp)
set(hcs,'EdgeColor',[0.65 0.65 0.65],'LineWidth',0.5,'FaceAlpha',0.85)%,'FaceAlpha',0.6
caxis([0 60])
h=colorbar
set(h,'fontsize',20);
colormap(jet)
set(h,'Ticks',(0:10:60))

hold on
for  i=1:length(text_lon)
    for j=1:length(text_lat)
        if eddy_numbe_samp(j,i)>0
        text(text_lon(i)-0.025,text_lat(j),num2str(eddy_numbe_samp(j,i)),'color','k','fontweight','bold','fontsize',10)
        end
    end
end

%%
tick_fontsize=18;
string_fontsize=14
gca_linewidth=2;
gca_fontsize=18;
colorbar_fontsize=12;


ttt=0:360
xx1=2*sin(ttt/360*2*pi);
yy1=2*cos(ttt/360*2*pi);
hold on
plot([-2 2],[0 0],'color','k','linewidth',2);
hold on
plot([0 0],[-2 2],'color','k','linewidth',2);
hold on
plot(xx1/2,yy1/2,'color','k','linewidth',2);

axis([-1.3 1.3 -1.3 1.3]);
axis square
set(gca,'linewidth',gca_linewidth,'box','on','tickdir','in','fontsize',gca_fontsize)
xlim([-1.3 1.3]);ylim([-1.3 1.3]);
set(gca,'ytick',[-1 0 1],'xtick',[-1 0 1],'xticklabels',{'-1R','0','1R'},...)
'yticklabels',{'-1R','0','1R'},'fontsize',gca_fontsize+10)
grid off
colormap(precip3_16lev)
