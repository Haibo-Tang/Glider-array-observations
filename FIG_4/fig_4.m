clc;clear all;
load('F:\12_glider\sla.mat')
load('F:\12_glider\fsle.mat')
load('F:\12_glider\wind.mat')
load('F:\12_glider\CHL.mat')
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
fsle_max=-fsle_max;

for i=1:length(sla_time);
sla_time1{i}=datestr(sla_time(i),'yyyy.mm.dd');
end
sla_time1=sla_time1';

[sla_x,sla_y]=meshgrid(sla_lon,sla_lat);
sla_x=sla_x'; sla_y=sla_y';

[fsle_x,fsle_y]=meshgrid(fsle_lon,fsle_lat);
fsle_x=fsle_x'; fsle_y=fsle_y';

%% Calculate buoyancy%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
K1000J003_b = 9.8.*(1-K1000J003dens./nanmean(K1000J003dens,1));
K1000J005_b = 9.8.*(1-K1000J005dens./nanmean(K1000J005dens,1));
K1000J007_b = 9.8.*(1-K1000J007dens./nanmean(K1000J007dens,1));
K1000J008_b = 9.8.*(1-K1000J008dens./nanmean(K1000J008dens,1));
K1000K008_b = 9.8.*(1-K1000K008dens./nanmean(K1000K008dens,1));
K1000K007_b = 9.8.*(1-K1000K007dens./nanmean(K1000K007dens,1));
K1000K005_b = 9.8.*(1-K1000K005dens./nanmean(K1000K005dens,1));
K1000K004_b = 9.8.*(1-K1000K004dens./nanmean(K1000K004dens,1));
K1000K003_b = 9.8.*(1-K1000K003dens./nanmean(K1000K003dens,1));
K300K003_b = 9.8.*(1-K300K003dens./nanmean(K300K003dens,1));
K300K004_b = 9.8.*(1-K300K004dens./nanmean(K300K004dens,1));
K300K001_b = 9.8.*(1-K300K001dens./nanmean(K300K001dens,1));

for i=1;
 n=1:length(K1000K008_b(1,:));n=n';
for i=1:length(K1000K008_time)
    m=find(n>=i-2& n<=i+2);
    K1000K008_b(:,i)=nanmean(K1000K008_b(:,m),2);
end
n=1:length(K1000K008_b(:,1));n=n';
for i=1:length(K1000K008_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000K008_b(i,:)=nanmean(K1000K008_b(m,:),1);
end
for i = 1:length(K1000K008_b(1,:))
    aa = abs(K1000K008_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000K008_lon(i);
    lat_glider(i) = K1000K008_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000K008_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000K008_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end   
    
 n=1:length(K1000K007_b(1,:));n=n';
for i=1:length(K1000K007_time)
    m=find(n>=i-2& n<=i+2);
    K1000K007_b(:,i)=nanmean(K1000K007_b(:,m),2);
end
n=1:length(K1000K007_b(:,1));n=n';
for i=1:length(K1000K007_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000K007_b(i,:)=nanmean(K1000K007_b(m,:),1);
end
for i = 1:length(K1000K007_b(1,:))
    aa = abs(K1000K007_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000K007_lon(i);
    lat_glider(i) = K1000K007_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000K007_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000K007_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end
      
 n=1:length(K1000K005_b(1,:));n=n';
for i=1:length(K1000K005_time)
    m=find(n>=i-2& n<=i+2);
    K1000K005_b(:,i)=nanmean(K1000K005_b(:,m),2);
end
n=1:length(K1000K005_b(:,1));n=n';
for i=1:length(K1000K005_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000K005_b(i,:)=nanmean(K1000K005_b(m,:),1);
end
for i = 1:length(K1000K005_b(1,:))
    aa = abs(K1000K005_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000K005_lon(i);
    lat_glider(i) = K1000K005_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000K005_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000K005_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K1000K004_b(1,:));n=n';
for i=1:length(K1000K004_time)
    m=find(n>=i-2& n<=i+2);
    K1000K004_b(:,i)=nanmean(K1000K004_b(:,m),2);
end
n=1:length(K1000K004_b(:,1));n=n';
for i=1:length(K1000K004_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000K004_b(i,:)=nanmean(K1000K004_b(m,:),1);
end
for i = 1:length(K1000K004_b(1,:))
    aa = abs(K1000K004_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000K004_lon(i);
    lat_glider(i) = K1000K004_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000K004_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000K004_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K1000K003_b(1,:));n=n';
for i=1:length(K1000K003_time)
    m=find(n>=i-2& n<=i+2);
    K1000K003_b(:,i)=nanmean(K1000K003_b(:,m),2);
end
n=1:length(K1000K003_b(:,1));n=n';
for i=1:length(K1000K003_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000K003_b(i,:)=nanmean(K1000K003_b(m,:),1);
end
for i = 1:length(K1000K003_b(1,:))
    aa = abs(K1000K003_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000K003_lon(i);
    lat_glider(i) = K1000K003_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000K003_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000K003_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K1000J008_b(1,:));n=n';
for i=1:length(K1000J008_time)
    m=find(n>=i-2& n<=i+2);
    K1000J008_b(:,i)=nanmean(K1000J008_b(:,m),2);
end
n=1:length(K1000J008_b(:,1));n=n';
for i=1:length(K1000J008_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000J008_b(i,:)=nanmean(K1000J008_b(m,:),1);
end
for i = 1:length(K1000J008_b(1,:))
    aa = abs(K1000J008_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000J008_lon(i);
    lat_glider(i) = K1000J008_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000J008_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000J008_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K1000J007_b(1,:));n=n';
for i=1:length(K1000J007_time)
    m=find(n>=i-2& n<=i+2);
    K1000J007_b(:,i)=nanmean(K1000J007_b(:,m),2);
end
n=1:length(K1000J007_b(:,1));n=n';
for i=1:length(K1000J007_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000J007_b(i,:)=nanmean(K1000J007_b(m,:),1);
end
for i = 1:length(K1000J007_b(1,:))
    aa = abs(K1000J007_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000J007_lon(i);
    lat_glider(i) = K1000J007_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000J007_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000J007_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K1000J005_b(1,:));n=n';
for i=1:length(K1000J005_time)
    m=find(n>=i-2& n<=i+2);
    K1000J005_b(:,i)=nanmean(K1000J005_b(:,m),2);
end
n=1:length(K1000J005_b(:,1));n=n';
for i=1:length(K1000J005_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000J005_b(i,:)=nanmean(K1000J005_b(m,:),1);
end
for i = 1:length(K1000J005_b(1,:))
    aa = abs(K1000J005_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000J005_lon(i);
    lat_glider(i) = K1000J005_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000J005_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000J005_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K1000J003_b(1,:));n=n';
for i=1:length(K1000J003_time)
    m=find(n>=i-2& n<=i+2);
    K1000J003_b(:,i)=nanmean(K1000J003_b(:,m),2);
end
n=1:length(K1000J003_b(:,1));n=n';
for i=1:length(K1000J003_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K1000J003_b(i,:)=nanmean(K1000J003_b(m,:),1);
end
for i = 1:length(K1000J003_b(1,:))
    aa = abs(K1000J003_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K1000J003_lon(i);
    lat_glider(i) = K1000J003_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K1000J003_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K1000J003_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K300K004_b(1,:));n=n';
for i=1:length(K300K004_time)
    m=find(n>=i-2& n<=i+2);
    K300K004_b(:,i)=nanmean(K300K004_b(:,m),2);
end
n=1:length(K300K004_b(:,1));n=n';
for i=1:length(K300K004_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K300K004_b(i,:)=nanmean(K300K004_b(m,:),1);
end
for i = 1:length(K300K004_b(1,:))
    aa = abs(K300K004_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K300K004_lon(i);
    lat_glider(i) = K300K004_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K300K004_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K300K004_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K300K003_b(1,:));n=n';
for i=1:length(K300K003_time)
    m=find(n>=i-2& n<=i+2);
    K300K003_b(:,i)=nanmean(K300K003_b(:,m),2);
end
n=1:length(K300K003_b(:,1));n=n';
for i=1:length(K300K003_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K300K003_b(i,:)=nanmean(K300K003_b(m,:),1);
end
for i = 1:length(K300K003_b(1,:))
    aa = abs(K300K003_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K300K003_lon(i);
    lat_glider(i) = K300K003_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K300K003_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K300K003_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end

n=1:length(K300K001_b(1,:));n=n';
for i=1:length(K300K001_time)
    m=find(n>=i-2& n<=i+2);
    K300K001_b(:,i)=nanmean(K300K001_b(:,m),2);
end
n=1:length(K300K001_b(:,1));n=n';
for i=1:length(K300K001_b(:,1))
    m=find(n>=i-2 & n<=i+2);
    K300K001_b(i,:)=nanmean(K300K001_b(m,:),1);
end
for i = 1:length(K300K001_b(1,:))
    aa = abs(K300K001_time(i)-wind_time);ii = find(aa == min(aa),1); 
    lon_glider(i) = K300K001_lon(i);
    lat_glider(i) = K300K001_lat(i);
    lons = lon_glider(i)-sqrt(1)/2;lone = lon_glider(i)+sqrt(1)/2;
    lats = lat_glider(i)-sqrt(1)/2;late = lat_glider(i)+sqrt(1)/2; %选定研究范围 TS
    aa = abs(wind_lon-lons);i1 = find(aa == min(aa)); %i1为数据东边界索引
    aa1 = abs(wind_lon-lone);i2 = find(aa1 == min(aa1)); %i2为数据西边界索引
    aa2 = abs(wind_lat-lats);j1 = find(aa2 == min(aa2)); %j1为数据南边界索引
    aa3 = abs(wind_lat-late);j2 = find(aa3 == min(aa3)); %j2为数据北边界索引
    K300K001_v10(i)=nanmean(nanmean(wind_v10(i1:i2,j2:j1,ii)));; 
    K300K001_u10(i)=nanmean(nanmean(wind_u10(i1:i2,j2:j1,ii)));;
end
    
end

K1000K008_b_top=nanmean(K1000K008_b(1:40,:,1));
K1000K007_b_top=nanmean(K1000K007_b(1:40,:,1));
K1000K005_b_top=nanmean(K1000K005_b(1:40,:,1));
K1000K004_b_top=nanmean(K1000K004_b(1:40,:,1));
K1000K003_b_top=nanmean(K1000K003_b(1:40,:,1));
K1000J008_b_top=nanmean(K1000J008_b(1:40,:,1));
K1000J007_b_top=nanmean(K1000J007_b(1:40,:,1));
K1000J005_b_top=nanmean(K1000J005_b(1:40,:,1));
K1000J003_b_top=nanmean(K1000J003_b(1:40,:,1));
K300K004_b_top=nanmean(K300K004_b(1:40,:,1));
K300K003_b_top=nanmean(K300K003_b(1:40,:,1));
K300K001_b_top=nanmean(K300K001_b(1:40,:,1));


%% figure

figure
hold on
time1=288;time2=461;
time_scan=time1:5:time2;
hq1=quiver(K1000K008_lon(time_scan),K1000K008_lat(time_scan),K1000K008_u10(time_scan),K1000K008_v10(time_scan))

hold on
time1=360;time2=505;
time_scan=time1:5:time2;
hq2=quiver(K1000K003_lon(time_scan),K1000K003_lat(time_scan),K1000K003_u10(time_scan),K1000K003_v10(time_scan))

hold on
time1=397;time2=561;
time_scan=time1:5:time2;
hq3=quiver(K1000K005_lon(time_scan),K1000K005_lat(time_scan),K1000K005_u10(time_scan),K1000K005_v10(time_scan))

hold on
time1=400;time2=502;
time_scan=time1:5:time2;
hq4=quiver(K1000K007_lon(time_scan),K1000K007_lat(time_scan),K1000K007_u10(time_scan),K1000K007_v10(time_scan))

hold on
time1=420;time2=520;
time_scan=time1:3:time2;
hq5=quiver(K1000K004_lon(time_scan),K1000K004_lat(time_scan),K1000K004_u10(time_scan),K1000K004_v10(time_scan))

hold on
hq6=quiver(120.3,22.75,10,0,'color','k','MaxHeadSize',5,'AutoScale','off','linewidth',3)
xlim([117 120.5]);ylim([19.5 23]);


%% 画浮力的平面图（锋面区域）
tick_fontsize=18;
string_fontsize=14
gca_linewidth=2;
gca_fontsize=35;
colorbar_fontsize=15;

load('GMT_polar.mat')
load('CBR_wet.mat')

%%%选取fsle的时间段为7/29-8/3(59-64)；选取ADT的时间段为7/29-8/3(59-64)
figure
time_scan=60:66;
quiver(sla_x,sla_y,nanmean(sla_u(:,:,time_scan),3)./3,nanmean(sla_v(:,:,time_scan),3)./3,'color',[.4 .4 .4],'LineWidth',1,'MaxHeadSize',2,'AutoScale','off')
hold on
[cs,h] =contour(sla_x,sla_y,nanmean(sla_adt(:,:,time_scan),3),[1:0.05:1.35] ,'color','k','LineWidth',1.5,'ShowText','on');
clabel(cs,h,'FontSize',15,'Color','k','FontWeight','bold');
hold on
contourf(fsle_x,fsle_y,nanmean(fsle_max(:,:,time_scan),3),[0.12:0.05:0.32],'linewidth',1,'ShowText','off')%nanmean(fsle_max(:,:,time_scan),3)
colormap(CBR_wet)
freezeColors
caxis([0 0.3])%0.6
hold on


%% 切割数据寻找穿越锋面的浮力断面%%%%%%%%%%%%%%%%%%
for mm=1 %%1000K008:7/31-8/5
sig_min1 =0.0447;
sig_max1=0.0517;
cm = (GMT_polar);
cmc = @(x)cm(1 + fix(18/ (sig_max1 - sig_min1) * (x - sig_min1)), :);
colorbar
%colormap(GMT_polar)
    
time1=288;time2=461;
time_scan=time1:5:time2;
max(K1000K008_b_top(time_scan))
min(K1000K008_b_top(time_scan))

plot(K1000K008_lon(time_scan),K1000K008_lat(time_scan),':','Color','k','markersize',20,'linewidth',2); 
hold on
for i=time_scan;
   plot(K1000K008_lon(i),K1000K008_lat(i),'.','Color',cmc(K1000K008_b_top(i)),'markersize',40,'linewidth',20); 
   hold on
end
hold on
plot(K1000K008_lon(time1),K1000K008_lat(time1),'p','color','k','markersize',15,'linewidth',3);
hold on
plot(K1000K008_lon(time2),K1000K008_lat(time2),'o','color','k','markersize',15,'linewidth',3); 

end

for mm=1 %%1000K003:7/29-8/4
sig_min1 =0.0470;
sig_max1=0.0517;
cm = (GMT_polar);
cmc = @(x)cm(1 + fix(18/ (sig_max1 - sig_min1) * (x - sig_min1)), :);
%     
time1=360;time2=505;
time_scan=time1:5:time2;
max(K1000K003_b_top(time_scan))
min(K1000K003_b_top(time_scan))
plot(K1000K003_lon(time_scan),K1000K003_lat(time_scan),':','Color','k','markersize',20,'linewidth',2); 
hold on
for i=time_scan;
   plot(K1000K003_lon(i),K1000K003_lat(i),'.','Color',cmc(K1000K003_b_top(i)),'markersize',40,'linewidth',20); 
   hold on
end
hold on
plot(K1000K003_lon(time1),K1000K003_lat(time1),'p','color','k','markersize',15,'linewidth',3); 
hold on
plot(K1000K003_lon(time2),K1000K003_lat(time2),'o','color','k','markersize',15,'linewidth',3); 

end

for mm=1 %%1000K005:7/28-8/01
time1=397;time2=561;
time_scan=time1:5:time2;
max(K1000K005_b_top(time_scan))
min(K1000K005_b_top(time_scan))
sig_min1 =0.0460;
sig_max1=0.0530;
cm = (GMT_polar);


cmc = @(x)cm(1 + fix(18/ (sig_max1 - sig_min1) * (x - sig_min1)), :);
plot(K1000K005_lon(time_scan),K1000K005_lat(time_scan),':','Color','k','markersize',20,'linewidth',2); 
hold on
for i=time_scan;
   plot(K1000K005_lon(i),K1000K005_lat(i),'.','Color',cmc(K1000K005_b_top(i)),'markersize',40,'linewidth',20); 
   hold on
end
hold on
plot(K1000K005_lon(time1),K1000K005_lat(time1),'p','color','k','markersize',15,'linewidth',3); 
hold on
plot(K1000K005_lon(time2),K1000K005_lat(time2),'o','color','k','markersize',15,'linewidth',3); 

end

for mm=1 %%1000K007:7/27-7/31
sig_min1 =0.0472;
sig_max1=0.0501;
cm = (GMT_polar);
cmc = @(x)cm(1 + fix(18/ (sig_max1 - sig_min1) * (x - sig_min1)), :);
    
max(K1000K007_b_top(time_scan))
min(K1000K007_b_top(time_scan))
time1=400;time2=502;
time_scan=time1:5:time2;
plot(K1000K007_lon(time_scan),K1000K007_lat(time_scan),':','Color','k','markersize',20,'linewidth',2); 
hold on
for i=time_scan;
   plot(K1000K007_lon(i),K1000K007_lat(i),'.','Color',cmc(K1000K007_b_top(i)),'markersize',40,'linewidth',20); 
   hold on
end
hold on
plot(K1000K007_lon(time1),K1000K007_lat(time1),'p','color','k','markersize',15,'linewidth',3); 
hold on
plot(K1000K007_lon(time2),K1000K007_lat(time2),'o','color','k','markersize',15,'linewidth',3); 
end

for mm=1 %%1000K004:8/4-8/8
time1=420;time2=520;
time_scan=time1:3:time2;
max(K1000K004_b_top(time_scan))
min(K1000K004_b_top(time_scan))
sig_min1 =0.0475;
sig_max1=0.0510;
cm = (GMT_polar);
cmc = @(x)cm(1 + fix(18/ (sig_max1 - sig_min1) * (x - sig_min1)), :);
%   

plot(K1000K004_lon(time_scan),K1000K004_lat(time_scan),':','Color','k','markersize',20,'linewidth',2); 
hold on
for i=time_scan;
   plot(K1000K004_lon(i),K1000K004_lat(i),'.','Color',cmc(K1000K004_b_top(i)),'markersize',40,'linewidth',20); 
   hold on
end
hold on
plot(K1000K004_lon(time1),K1000K004_lat(time1),'p','color','k','markersize',15,'linewidth',3); 
hold on
plot(K1000K004_lon(time2),K1000K004_lat(time2),'o','color','k','markersize',15,'linewidth',3); 
end


%% 设置背景坐标%%%%%%%%%%%%%%%%%%
h = colorbar;
set(h,'fontsize',colorbar_fontsize,'ytick',0:0.05:0.3,'yticklabel',[0 -0.05 -0.1 -0.15 -0.2 -0.25 -0.3])
set(get(h,'Title'),'string','FSLE','fontsize',13.);


set(gca,'XTickLabelRotation',0,'tickdir','in','XAxisLocation','top','fontsize',20,'linewidth',3);%
    xlim([117 120.8]);ylim([19.2 23]);
    axis([117 120.8 19.2 23]);
    set(gca,'ytick',[20 21 22 23],'xtick',[117 118 119 120])
    axis square
set(gca,'linewidth',gca_linewidth,'box','on','tickdir','in','fontsize',gca_fontsize)
xlabel('Longitude','fontsize',25);ylabel('Latitude','fontsize',25);

hold on
quiver(120.3,22.88,0.5/3,0,'color',[.4 .4 .4],'LineWidth',1,'MaxHeadSize',2,'AutoScale','off')
hold on
text(120.3,22.93,'ADT 0.3 m/s','fontsize',10,'color',[.4 .4 .4])

hold on
text(120.3,22.82,'Wind 10 m/s','fontsize',10,'color','k')


%% set arrow%%%%%%%%%%%%%%%%

headLength = 8;
LineLength = 0.02;
for i=1:6;
    clear hq
    hq=eval(['hq',num2str(i)]);
U = hq.UData;
V = hq.VData;
X = hq.XData;
Y = hq.YData;
for ii = 1:length(X)
        headWidth = 8;
        ah = annotation('arrow',...
            'headStyle','plain','HeadLength',headLength,'linewidth',2,'HeadWidth',headWidth);
        set(ah,'parent',gca);
        set(ah,'position',[X(ii) Y(ii) LineLength*U(ii) LineLength*V(ii)]);
end
end

