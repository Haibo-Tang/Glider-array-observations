clear all
clc
load('fig_5.mat')


%% Tu%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1;
n=1:length(K300K001_time);n=n';
for i=1:length(K300K001_time);
    m=find(n>=i-1 & n<=i+1);
    K300K001_temp(:,i)=nanmean(K300K001_temp(:,m),2);
    K300K001_salt(:,i)=nanmean(K300K001_salt(:,m),2);
end
n=1:length(K300K001_dens(:,1));n=n';
for i=1:length(K300K001_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K300K001_temp(i,:)=nanmean(K300K001_temp(m,:),1);
    K300K001_salt(i,:)=nanmean(K300K001_salt(m,:),1);
end
K300K001_tx = nan*ones(length(K300K001_temp(:,1)),length(K300K001_temp(1,:)));
K300K001_sx = nan*ones(length(K300K001_temp(:,1)),length(K300K001_temp(1,:)));
for i = 1:length(K300K001_temp(:,1))
    K300K001_tx(i,1:end) = gradient(K300K001_temp(i,:))./gradient(K300K001_dist);
    K300K001_sx(i,1:end) = gradient(K300K001_salt(i,:))./gradient(K300K001_dist);
end

K300K001_tz = nan*ones(length(K300K001_temp(:,1)),length(K300K001_temp(1,:)));
K300K001_sz = nan*ones(length(K300K001_temp(:,1)),length(K300K001_temp(1,:)));
for i = 1:length(K300K001_temp(1,:))
    K300K001_tz(2:end,i) = -gradient(K300K001_temp(2:end,i))./1;
    K300K001_sz(2:end,i) = -gradient(K300K001_salt(2:end,i))./1;
end

K300K001_alpha_beta=sw_aonb(K300K001_salt,K300K001_temp,K300K001_dept,'temp');
K300K001_alpha=sw_alpha(K300K001_salt,K300K001_temp,K300K001_dept,'temp');
K300K001_beta=sw_beta(K300K001_salt,K300K001_temp,K300K001_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K300K001_Densityratio_z=K300K001_alpha_beta.*K300K001_tz./K300K001_sz;%%% 计算角度
K300K001_Densityratio_x=K300K001_alpha_beta.*K300K001_tx./K300K001_sx;%%% 计算角度
K300K001_Density_grad=(K300K001_alpha.*K300K001_tx).^2+(K300K001_sx.*K300K001_beta).^2;%%% 计算角度
K300K001_cov=2.*K300K001_alpha.*K300K001_beta.*K300K001_tx.*K300K001_sx./...
    [(K300K001_alpha.*K300K001_tx).^2+(K300K001_sx.*K300K001_beta).^2];%%% 计算协方差
K300K001_fai_TU_z = atan(K300K001_Densityratio_z);
K300K001_fai_TU_x = atan(K300K001_Densityratio_x);
end

for i=1;
n=1:length(K300K003_time);n=n';
for i=1:length(K300K003_time);
    m=find(n>=i-1 & n<=i+1);
    K300K003_temp(:,i)=nanmean(K300K003_temp(:,m),2);
    K300K003_salt(:,i)=nanmean(K300K003_salt(:,m),2);
end
n=1:length(K300K003_dens(:,1));n=n';
for i=1:length(K300K003_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K300K003_temp(i,:)=nanmean(K300K003_temp(m,:),1);
    K300K003_salt(i,:)=nanmean(K300K003_salt(m,:),1);
end
K300K003_tx = nan*ones(length(K300K003_temp(:,1)),length(K300K003_temp(1,:)));
K300K003_sx = nan*ones(length(K300K003_temp(:,1)),length(K300K003_temp(1,:)));
for i = 1:length(K300K003_temp(:,1))
    K300K003_tx(i,1:end) = gradient(K300K003_temp(i,:))./gradient(K300K003_dist);
    K300K003_sx(i,1:end) = gradient(K300K003_salt(i,:))./gradient(K300K003_dist);
end

K300K003_tz = nan*ones(length(K300K003_temp(:,1)),length(K300K003_temp(1,:)));
K300K003_sz = nan*ones(length(K300K003_temp(:,1)),length(K300K003_temp(1,:)));
for i = 1:length(K300K003_temp(1,:))
    K300K003_tz(2:end,i) = -gradient(K300K003_temp(2:end,i))./1;
    K300K003_sz(2:end,i) = -gradient(K300K003_salt(2:end,i))./1;
end

K300K003_alpha_beta=sw_aonb(K300K003_salt,K300K003_temp,K300K003_dept,'temp');
K300K003_alpha=sw_alpha(K300K003_salt,K300K003_temp,K300K003_dept,'temp');
K300K003_beta=sw_beta(K300K003_salt,K300K003_temp,K300K003_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K300K003_Densityratio_z=K300K003_alpha_beta.*K300K003_tz./K300K003_sz;%%% 计算角度
K300K003_Densityratio_x=K300K003_alpha_beta.*K300K003_tx./K300K003_sx;%%% 计算角度
K300K003_Density_grad=(K300K003_alpha.*K300K003_tx).^2+(K300K003_sx.*K300K003_beta).^2;%%% 计算角度
K300K003_cov=2.*K300K003_alpha.*K300K003_beta.*K300K003_tx.*K300K003_sx./...
    [(K300K003_alpha.*K300K003_tx).^2+(K300K003_sx.*K300K003_beta).^2];%%% 计算协方差
K300K003_fai_TU_z = atan(K300K003_Densityratio_z);
K300K003_fai_TU_x = atan(K300K003_Densityratio_x);
end

for i=1;
n=1:length(K300K004_time);n=n';
for i=1:length(K300K004_time);
    m=find(n>=i-1 & n<=i+1);
    K300K004_temp(:,i)=nanmean(K300K004_temp(:,m),2);
    K300K004_salt(:,i)=nanmean(K300K004_salt(:,m),2);
end
n=1:length(K300K004_dens(:,1));n=n';
for i=1:length(K300K004_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K300K004_temp(i,:)=nanmean(K300K004_temp(m,:),1);
    K300K004_salt(i,:)=nanmean(K300K004_salt(m,:),1);
end
K300K004_tx = nan*ones(length(K300K004_temp(:,1)),length(K300K004_temp(1,:)));
K300K004_sx = nan*ones(length(K300K004_temp(:,1)),length(K300K004_temp(1,:)));
for i = 1:length(K300K004_temp(:,1))
    K300K004_tx(i,1:end) = gradient(K300K004_temp(i,:))./gradient(K300K004_dist);
    K300K004_sx(i,1:end) = gradient(K300K004_salt(i,:))./gradient(K300K004_dist);
end

K300K004_tz = nan*ones(length(K300K004_temp(:,1)),length(K300K004_temp(1,:)));
K300K004_sz = nan*ones(length(K300K004_temp(:,1)),length(K300K004_temp(1,:)));
for i = 1:length(K300K004_temp(1,:))
    K300K004_tz(2:end,i) = -gradient(K300K004_temp(2:end,i))./1;
    K300K004_sz(2:end,i) = -gradient(K300K004_salt(2:end,i))./1;
end

K300K004_alpha_beta=sw_aonb(K300K004_salt,K300K004_temp,K300K004_dept,'temp');
K300K004_alpha=sw_alpha(K300K004_salt,K300K004_temp,K300K004_dept,'temp');
K300K004_beta=sw_beta(K300K004_salt,K300K004_temp,K300K004_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K300K004_Densityratio_z=K300K004_alpha_beta.*K300K004_tz./K300K004_sz;%%% 计算角度
K300K004_Densityratio_x=K300K004_alpha_beta.*K300K004_tx./K300K004_sx;%%% 计算角度
K300K004_Density_grad=(K300K004_alpha.*K300K004_tx).^2+(K300K004_sx.*K300K004_beta).^2;%%% 计算角度
K300K004_cov=2.*K300K004_alpha.*K300K004_beta.*K300K004_tx.*K300K004_sx./...
    [(K300K004_alpha.*K300K004_tx).^2+(K300K004_sx.*K300K004_beta).^2];%%% 计算协方差
K300K004_fai_TU_z = atan(K300K004_Densityratio_z);
K300K004_fai_TU_x = atan(K300K004_Densityratio_x);
end

for i=1;
n=1:length(K1000J003_time);n=n';
for i=1:length(K1000J003_time);
    m=find(n>=i-1 & n<=i+1);
    K1000J003_temp(:,i)=nanmean(K1000J003_temp(:,m),2);
    K1000J003_salt(:,i)=nanmean(K1000J003_salt(:,m),2);
end
n=1:length(K1000J003_dens(:,1));n=n';
for i=1:length(K1000J003_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000J003_temp(i,:)=nanmean(K1000J003_temp(m,:),1);
    K1000J003_salt(i,:)=nanmean(K1000J003_salt(m,:),1);
end
K1000J003_tx = nan*ones(length(K1000J003_temp(:,1)),length(K1000J003_temp(1,:)));
K1000J003_sx = nan*ones(length(K1000J003_temp(:,1)),length(K1000J003_temp(1,:)));
for i = 1:length(K1000J003_temp(:,1))
    K1000J003_tx(i,1:end) = gradient(K1000J003_temp(i,:))./gradient(K1000J003_dist);
    K1000J003_sx(i,1:end) = gradient(K1000J003_salt(i,:))./gradient(K1000J003_dist);
end

K1000J003_tz = nan*ones(length(K1000J003_temp(:,1)),length(K1000J003_temp(1,:)));
K1000J003_sz = nan*ones(length(K1000J003_temp(:,1)),length(K1000J003_temp(1,:)));
for i = 1:length(K1000J003_temp(1,:))
    K1000J003_tz(2:end,i) = -gradient(K1000J003_temp(2:end,i))./1;
    K1000J003_sz(2:end,i) = -gradient(K1000J003_salt(2:end,i))./1;
end

K1000J003_alpha_beta=sw_aonb(K1000J003_salt,K1000J003_temp,K1000J003_dept,'temp');
K1000J003_alpha=sw_alpha(K1000J003_salt,K1000J003_temp,K1000J003_dept,'temp');
K1000J003_beta=sw_beta(K1000J003_salt,K1000J003_temp,K1000J003_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000J003_Densityratio_z=K1000J003_alpha_beta.*K1000J003_tz./K1000J003_sz;%%% 计算角度
K1000J003_Densityratio_x=K1000J003_alpha_beta.*K1000J003_tx./K1000J003_sx;%%% 计算角度
K1000J003_Density_grad=(K1000J003_alpha.*K1000J003_tx).^2+(K1000J003_sx.*K1000J003_beta).^2;%%% 计算角度
K1000J003_cov=2.*K1000J003_alpha.*K1000J003_beta.*K1000J003_tx.*K1000J003_sx./...
    [(K1000J003_alpha.*K1000J003_tx).^2+(K1000J003_sx.*K1000J003_beta).^2];%%% 计算协方差
K1000J003_fai_TU_z = atan(K1000J003_Densityratio_z);
K1000J003_fai_TU_x = atan(K1000J003_Densityratio_x);
end

for i=1;
n=1:length(K1000J005_time);n=n';
for i=1:length(K1000J005_time);
    m=find(n>=i-1 & n<=i+1);
    K1000J005_temp(:,i)=nanmean(K1000J005_temp(:,m),2);
    K1000J005_salt(:,i)=nanmean(K1000J005_salt(:,m),2);
end
n=1:length(K1000J005_dens(:,1));n=n';
for i=1:length(K1000J005_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000J005_temp(i,:)=nanmean(K1000J005_temp(m,:),1);
    K1000J005_salt(i,:)=nanmean(K1000J005_salt(m,:),1);
end
K1000J005_tx = nan*ones(length(K1000J005_temp(:,1)),length(K1000J005_temp(1,:)));
K1000J005_sx = nan*ones(length(K1000J005_temp(:,1)),length(K1000J005_temp(1,:)));
for i = 1:length(K1000J005_temp(:,1))
    K1000J005_tx(i,1:end) = gradient(K1000J005_temp(i,:))./gradient(K1000J005_dist);
    K1000J005_sx(i,1:end) = gradient(K1000J005_salt(i,:))./gradient(K1000J005_dist);
end

K1000J005_tz = nan*ones(length(K1000J005_temp(:,1)),length(K1000J005_temp(1,:)));
K1000J005_sz = nan*ones(length(K1000J005_temp(:,1)),length(K1000J005_temp(1,:)));
for i = 1:length(K1000J005_temp(1,:))
    K1000J005_tz(2:end,i) = -gradient(K1000J005_temp(2:end,i))./1;
    K1000J005_sz(2:end,i) = -gradient(K1000J005_salt(2:end,i))./1;
end

K1000J005_alpha_beta=sw_aonb(K1000J005_salt,K1000J005_temp,K1000J005_dept,'temp');
K1000J005_alpha=sw_alpha(K1000J005_salt,K1000J005_temp,K1000J005_dept,'temp');
K1000J005_beta=sw_beta(K1000J005_salt,K1000J005_temp,K1000J005_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000J005_Densityratio_z=K1000J005_alpha_beta.*K1000J005_tz./K1000J005_sz;%%% 计算角度
K1000J005_Densityratio_x=K1000J005_alpha_beta.*K1000J005_tx./K1000J005_sx;%%% 计算角度
K1000J005_Density_grad=(K1000J005_alpha.*K1000J005_tx).^2+(K1000J005_sx.*K1000J005_beta).^2;%%% 计算角度
K1000J005_cov=2.*K1000J005_alpha.*K1000J005_beta.*K1000J005_tx.*K1000J005_sx./...
    [(K1000J005_alpha.*K1000J005_tx).^2+(K1000J005_sx.*K1000J005_beta).^2];%%% 计算协方差
K1000J005_fai_TU_z = atan(K1000J005_Densityratio_z);
K1000J005_fai_TU_x = atan(K1000J005_Densityratio_x);
end

for i=1;
n=1:length(K1000J007_time);n=n';
for i=1:length(K1000J007_time);
    m=find(n>=i-1 & n<=i+1);
    K1000J007_temp(:,i)=nanmean(K1000J007_temp(:,m),2);
    K1000J007_salt(:,i)=nanmean(K1000J007_salt(:,m),2);
end
n=1:length(K1000J007_dens(:,1));n=n';
for i=1:length(K1000J007_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000J007_temp(i,:)=nanmean(K1000J007_temp(m,:),1);
    K1000J007_salt(i,:)=nanmean(K1000J007_salt(m,:),1);
end
K1000J007_tx = nan*ones(length(K1000J007_temp(:,1)),length(K1000J007_temp(1,:)));
K1000J007_sx = nan*ones(length(K1000J007_temp(:,1)),length(K1000J007_temp(1,:)));
for i = 1:length(K1000J007_temp(:,1))
    K1000J007_tx(i,1:end) = gradient(K1000J007_temp(i,:))./gradient(K1000J007_dist);
    K1000J007_sx(i,1:end) = gradient(K1000J007_salt(i,:))./gradient(K1000J007_dist);
end

K1000J007_tz = nan*ones(length(K1000J007_temp(:,1)),length(K1000J007_temp(1,:)));
K1000J007_sz = nan*ones(length(K1000J007_temp(:,1)),length(K1000J007_temp(1,:)));
for i = 1:length(K1000J007_temp(1,:))
    K1000J007_tz(2:end,i) = -gradient(K1000J007_temp(2:end,i))./1;
    K1000J007_sz(2:end,i) = -gradient(K1000J007_salt(2:end,i))./1;
end

K1000J007_alpha_beta=sw_aonb(K1000J007_salt,K1000J007_temp,K1000J007_dept,'temp');
K1000J007_alpha=sw_alpha(K1000J007_salt,K1000J007_temp,K1000J007_dept,'temp');
K1000J007_beta=sw_beta(K1000J007_salt,K1000J007_temp,K1000J007_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000J007_Densityratio_z=K1000J007_alpha_beta.*K1000J007_tz./K1000J007_sz;%%% 计算角度
K1000J007_Densityratio_x=K1000J007_alpha_beta.*K1000J007_tx./K1000J007_sx;%%% 计算角度
K1000J007_Density_grad=(K1000J007_alpha.*K1000J007_tx).^2+(K1000J007_sx.*K1000J007_beta).^2;%%% 计算角度
K1000J007_cov=2.*K1000J007_alpha.*K1000J007_beta.*K1000J007_tx.*K1000J007_sx./...
    [(K1000J007_alpha.*K1000J007_tx).^2+(K1000J007_sx.*K1000J007_beta).^2];%%% 计算协方差
K1000J007_fai_TU_z = atan(K1000J007_Densityratio_z);
K1000J007_fai_TU_x = atan(K1000J007_Densityratio_x);
end

for i=1;
n=1:length(K1000J008_time);n=n';
for i=1:length(K1000J008_time);
    m=find(n>=i-1 & n<=i+1);
    K1000J008_temp(:,i)=nanmean(K1000J008_temp(:,m),2);
    K1000J008_salt(:,i)=nanmean(K1000J008_salt(:,m),2);
end
n=1:length(K1000J008_dens(:,1));n=n';
for i=1:length(K1000J008_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000J008_temp(i,:)=nanmean(K1000J008_temp(m,:),1);
    K1000J008_salt(i,:)=nanmean(K1000J008_salt(m,:),1);
end
K1000J008_tx = nan*ones(length(K1000J008_temp(:,1)),length(K1000J008_temp(1,:)));
K1000J008_sx = nan*ones(length(K1000J008_temp(:,1)),length(K1000J008_temp(1,:)));
for i = 1:length(K1000J008_temp(:,1))
    K1000J008_tx(i,1:end) = gradient(K1000J008_temp(i,:))./gradient(K1000J008_dist);
    K1000J008_sx(i,1:end) = gradient(K1000J008_salt(i,:))./gradient(K1000J008_dist);
end

K1000J008_tz = nan*ones(length(K1000J008_temp(:,1)),length(K1000J008_temp(1,:)));
K1000J008_sz = nan*ones(length(K1000J008_temp(:,1)),length(K1000J008_temp(1,:)));
for i = 1:length(K1000J008_temp(1,:))
    K1000J008_tz(2:end,i) = -gradient(K1000J008_temp(2:end,i))./1;
    K1000J008_sz(2:end,i) = -gradient(K1000J008_salt(2:end,i))./1;
end

K1000J008_alpha_beta=sw_aonb(K1000J008_salt,K1000J008_temp,K1000J008_dept,'temp');
K1000J008_alpha=sw_alpha(K1000J008_salt,K1000J008_temp,K1000J008_dept,'temp');
K1000J008_beta=sw_beta(K1000J008_salt,K1000J008_temp,K1000J008_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000J008_Densityratio_z=K1000J008_alpha_beta.*K1000J008_tz./K1000J008_sz;%%% 计算角度
K1000J008_Densityratio_x=K1000J008_alpha_beta.*K1000J008_tx./K1000J008_sx;%%% 计算角度
K1000J008_Density_grad=(K1000J008_alpha.*K1000J008_tx).^2+(K1000J008_sx.*K1000J008_beta).^2;%%% 计算角度
K1000J008_cov=2.*K1000J008_alpha.*K1000J008_beta.*K1000J008_tx.*K1000J008_sx./...
    [(K1000J008_alpha.*K1000J008_tx).^2+(K1000J008_sx.*K1000J008_beta).^2];%%% 计算协方差
K1000J008_fai_TU_z = atan(K1000J008_Densityratio_z);
K1000J008_fai_TU_x = atan(K1000J008_Densityratio_x);
end

for i=1;
n=1:length(K1000K003_time);n=n';
for i=1:length(K1000K003_time);
    m=find(n>=i-1 & n<=i+1);
    K1000K003_temp(:,i)=nanmean(K1000K003_temp(:,m),2);
    K1000K003_salt(:,i)=nanmean(K1000K003_salt(:,m),2);
end
n=1:length(K1000K003_dens(:,1));n=n';
for i=1:length(K1000K003_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000K003_temp(i,:)=nanmean(K1000K003_temp(m,:),1);
    K1000K003_salt(i,:)=nanmean(K1000K003_salt(m,:),1);
end
K1000K003_tx = nan*ones(length(K1000K003_temp(:,1)),length(K1000K003_temp(1,:)));
K1000K003_sx = nan*ones(length(K1000K003_temp(:,1)),length(K1000K003_temp(1,:)));
for i = 1:length(K1000K003_temp(:,1))
    K1000K003_tx(i,1:end) = gradient(K1000K003_temp(i,:))./gradient(K1000K003_dist);
    K1000K003_sx(i,1:end) = gradient(K1000K003_salt(i,:))./gradient(K1000K003_dist);
end

K1000K003_tz = nan*ones(length(K1000K003_temp(:,1)),length(K1000K003_temp(1,:)));
K1000K003_sz = nan*ones(length(K1000K003_temp(:,1)),length(K1000K003_temp(1,:)));
for i = 1:length(K1000K003_temp(1,:))
    K1000K003_tz(2:end,i) = -gradient(K1000K003_temp(2:end,i))./1;
    K1000K003_sz(2:end,i) = -gradient(K1000K003_salt(2:end,i))./1;
end

K1000K003_alpha_beta=sw_aonb(K1000K003_salt,K1000K003_temp,K1000K003_dept,'temp');
K1000K003_alpha=sw_alpha(K1000K003_salt,K1000K003_temp,K1000K003_dept,'temp');
K1000K003_beta=sw_beta(K1000K003_salt,K1000K003_temp,K1000K003_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000K003_Densityratio_z=K1000K003_alpha_beta.*K1000K003_tz./K1000K003_sz;%%% 计算角度
K1000K003_Densityratio_x=K1000K003_alpha_beta.*K1000K003_tx./K1000K003_sx;%%% 计算角度
K1000K003_Density_grad=(K1000K003_alpha.*K1000K003_tx).^2+(K1000K003_sx.*K1000K003_beta).^2;%%% 计算角度
K1000K003_cov=2.*K1000K003_alpha.*K1000K003_beta.*K1000K003_tx.*K1000K003_sx./...
    [(K1000K003_alpha.*K1000K003_tx).^2+(K1000K003_sx.*K1000K003_beta).^2];%%% 计算协方差
K1000K003_fai_TU_z = atan(K1000K003_Densityratio_z);
K1000K003_fai_TU_x = atan(K1000K003_Densityratio_x);
end

for i=1;
n=1:length(K1000K004_time);n=n';
for i=1:length(K1000K004_time);
    m=find(n>=i-1 & n<=i+1);
    K1000K004_temp(:,i)=nanmean(K1000K004_temp(:,m),2);
    K1000K004_salt(:,i)=nanmean(K1000K004_salt(:,m),2);
end
n=1:length(K1000K004_dens(:,1));n=n';
for i=1:length(K1000K004_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000K004_temp(i,:)=nanmean(K1000K004_temp(m,:),1);
    K1000K004_salt(i,:)=nanmean(K1000K004_salt(m,:),1);
end
K1000K004_tx = nan*ones(length(K1000K004_temp(:,1)),length(K1000K004_temp(1,:)));
K1000K004_sx = nan*ones(length(K1000K004_temp(:,1)),length(K1000K004_temp(1,:)));
for i = 1:length(K1000K004_temp(:,1))
    K1000K004_tx(i,1:end) = gradient(K1000K004_temp(i,:))./gradient(K1000K004_dist);
    K1000K004_sx(i,1:end) = gradient(K1000K004_salt(i,:))./gradient(K1000K004_dist);
end

K1000K004_tz = nan*ones(length(K1000K004_temp(:,1)),length(K1000K004_temp(1,:)));
K1000K004_sz = nan*ones(length(K1000K004_temp(:,1)),length(K1000K004_temp(1,:)));
for i = 1:length(K1000K004_temp(1,:))
    K1000K004_tz(2:end,i) = -gradient(K1000K004_temp(2:end,i))./1;
    K1000K004_sz(2:end,i) = -gradient(K1000K004_salt(2:end,i))./1;
end

K1000K004_alpha_beta=sw_aonb(K1000K004_salt,K1000K004_temp,K1000K004_dept,'temp');
K1000K004_alpha=sw_alpha(K1000K004_salt,K1000K004_temp,K1000K004_dept,'temp');
K1000K004_beta=sw_beta(K1000K004_salt,K1000K004_temp,K1000K004_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000K004_Densityratio_z=K1000K004_alpha_beta.*K1000K004_tz./K1000K004_sz;%%% 计算角度
K1000K004_Densityratio_x=K1000K004_alpha_beta.*K1000K004_tx./K1000K004_sx;%%% 计算角度
K1000K004_Density_grad=(K1000K004_alpha.*K1000K004_tx).^2+(K1000K004_sx.*K1000K004_beta).^2;%%% 计算角度
K1000K004_cov=2.*K1000K004_alpha.*K1000K004_beta.*K1000K004_tx.*K1000K004_sx./...
    [(K1000K004_alpha.*K1000K004_tx).^2+(K1000K004_sx.*K1000K004_beta).^2];%%% 计算协方差
K1000K004_fai_TU_z = atan(K1000K004_Densityratio_z);
K1000K004_fai_TU_x = atan(K1000K004_Densityratio_x);
end

for i=1;
n=1:length(K1000K005_time);n=n';
for i=1:length(K1000K005_time);
    m=find(n>=i-1 & n<=i+1);
    K1000K005_temp(:,i)=nanmean(K1000K005_temp(:,m),2);
    K1000K005_salt(:,i)=nanmean(K1000K005_salt(:,m),2);
end
n=1:length(K1000K005_dens(:,1));n=n';
for i=1:length(K1000K005_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000K005_temp(i,:)=nanmean(K1000K005_temp(m,:),1);
    K1000K005_salt(i,:)=nanmean(K1000K005_salt(m,:),1);
end
K1000K005_tx = nan*ones(length(K1000K005_temp(:,1)),length(K1000K005_temp(1,:)));
K1000K005_sx = nan*ones(length(K1000K005_temp(:,1)),length(K1000K005_temp(1,:)));
for i = 1:length(K1000K005_temp(:,1))
    K1000K005_tx(i,1:end) = gradient(K1000K005_temp(i,:))./gradient(K1000K005_dist);
    K1000K005_sx(i,1:end) = gradient(K1000K005_salt(i,:))./gradient(K1000K005_dist);
end

K1000K005_tz = nan*ones(length(K1000K005_temp(:,1)),length(K1000K005_temp(1,:)));
K1000K005_sz = nan*ones(length(K1000K005_temp(:,1)),length(K1000K005_temp(1,:)));
for i = 1:length(K1000K005_temp(1,:))
    K1000K005_tz(2:end,i) = -gradient(K1000K005_temp(2:end,i))./1;
    K1000K005_sz(2:end,i) = -gradient(K1000K005_salt(2:end,i))./1;
end

K1000K005_alpha_beta=sw_aonb(K1000K005_salt,K1000K005_temp,K1000K005_dept,'temp');
K1000K005_alpha=sw_alpha(K1000K005_salt,K1000K005_temp,K1000K005_dept,'temp');
K1000K005_beta=sw_beta(K1000K005_salt,K1000K005_temp,K1000K005_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000K005_Densityratio_z=K1000K005_alpha_beta.*K1000K005_tz./K1000K005_sz;%%% 计算角度
K1000K005_Densityratio_x=K1000K005_alpha_beta.*K1000K005_tx./K1000K005_sx;%%% 计算角度
K1000K005_Density_grad=(K1000K005_alpha.*K1000K005_tx).^2+(K1000K005_sx.*K1000K005_beta).^2;%%% 计算角度
K1000K005_cov=2.*K1000K005_alpha.*K1000K005_beta.*K1000K005_tx.*K1000K005_sx./...
    [(K1000K005_alpha.*K1000K005_tx).^2+(K1000K005_sx.*K1000K005_beta).^2];%%% 计算协方差
K1000K005_fai_TU_z = atan(K1000K005_Densityratio_z);
K1000K005_fai_TU_x = atan(K1000K005_Densityratio_x);
end

for i=1;
n=1:length(K1000K007_time);n=n';
for i=1:length(K1000K007_time);
    m=find(n>=i-1 & n<=i+1);
    K1000K007_temp(:,i)=nanmean(K1000K007_temp(:,m),2);
    K1000K007_salt(:,i)=nanmean(K1000K007_salt(:,m),2);
end
n=1:length(K1000K007_dens(:,1));n=n';
for i=1:length(K1000K007_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000K007_temp(i,:)=nanmean(K1000K007_temp(m,:),1);
    K1000K007_salt(i,:)=nanmean(K1000K007_salt(m,:),1);
end
K1000K007_tx = nan*ones(length(K1000K007_temp(:,1)),length(K1000K007_temp(1,:)));
K1000K007_sx = nan*ones(length(K1000K007_temp(:,1)),length(K1000K007_temp(1,:)));
for i = 1:length(K1000K007_temp(:,1))
    K1000K007_tx(i,1:end) = gradient(K1000K007_temp(i,:))./gradient(K1000K007_dist);
    K1000K007_sx(i,1:end) = gradient(K1000K007_salt(i,:))./gradient(K1000K007_dist);
end

K1000K007_tz = nan*ones(length(K1000K007_temp(:,1)),length(K1000K007_temp(1,:)));
K1000K007_sz = nan*ones(length(K1000K007_temp(:,1)),length(K1000K007_temp(1,:)));
for i = 1:length(K1000K007_temp(1,:))
    K1000K007_tz(2:end,i) = -gradient(K1000K007_temp(2:end,i))./1;
    K1000K007_sz(2:end,i) = -gradient(K1000K007_salt(2:end,i))./1;
end

K1000K007_alpha_beta=sw_aonb(K1000K007_salt,K1000K007_temp,K1000K007_dept,'temp');
K1000K007_alpha=sw_alpha(K1000K007_salt,K1000K007_temp,K1000K007_dept,'temp');
K1000K007_beta=sw_beta(K1000K007_salt,K1000K007_temp,K1000K007_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000K007_Densityratio_z=K1000K007_alpha_beta.*K1000K007_tz./K1000K007_sz;%%% 计算角度
K1000K007_Densityratio_x=K1000K007_alpha_beta.*K1000K007_tx./K1000K007_sx;%%% 计算角度
K1000K007_Density_grad=(K1000K007_alpha.*K1000K007_tx).^2+(K1000K007_sx.*K1000K007_beta).^2;%%% 计算角度
K1000K007_cov=2.*K1000K007_alpha.*K1000K007_beta.*K1000K007_tx.*K1000K007_sx./...
    [(K1000K007_alpha.*K1000K007_tx).^2+(K1000K007_sx.*K1000K007_beta).^2];%%% 计算协方差
K1000K007_fai_TU_z = atan(K1000K007_Densityratio_z);
K1000K007_fai_TU_x = atan(K1000K007_Densityratio_x);
end

for i=1;
n=1:length(K1000K008_time);n=n';
for i=1:length(K1000K008_time);
    m=find(n>=i-1 & n<=i+1);
    K1000K008_temp(:,i)=nanmean(K1000K008_temp(:,m),2);
    K1000K008_salt(:,i)=nanmean(K1000K008_salt(:,m),2);
end
n=1:length(K1000K008_dens(:,1));n=n';
for i=1:length(K1000K008_dens(:,1))
    m=find(n>=i-1 & n<=i+1);
    K1000K008_temp(i,:)=nanmean(K1000K008_temp(m,:),1);
    K1000K008_salt(i,:)=nanmean(K1000K008_salt(m,:),1);
end
K1000K008_tx = nan*ones(length(K1000K008_temp(:,1)),length(K1000K008_temp(1,:)));
K1000K008_sx = nan*ones(length(K1000K008_temp(:,1)),length(K1000K008_temp(1,:)));
for i = 1:length(K1000K008_temp(:,1))
    K1000K008_tx(i,1:end) = gradient(K1000K008_temp(i,:))./gradient(K1000K008_dist);
    K1000K008_sx(i,1:end) = gradient(K1000K008_salt(i,:))./gradient(K1000K008_dist);
end

K1000K008_tz = nan*ones(length(K1000K008_temp(:,1)),length(K1000K008_temp(1,:)));
K1000K008_sz = nan*ones(length(K1000K008_temp(:,1)),length(K1000K008_temp(1,:)));
for i = 1:length(K1000K008_temp(1,:))
    K1000K008_tz(2:end,i) = -gradient(K1000K008_temp(2:end,i))./1;
    K1000K008_sz(2:end,i) = -gradient(K1000K008_salt(2:end,i))./1;
end

K1000K008_alpha_beta=sw_aonb(K1000K008_salt,K1000K008_temp,K1000K008_dept,'temp');
K1000K008_alpha=sw_alpha(K1000K008_salt,K1000K008_temp,K1000K008_dept,'temp');
K1000K008_beta=sw_beta(K1000K008_salt,K1000K008_temp,K1000K008_dept,'temp');
%alpha_beta1=nanmean(nanmean(alpha_beta));
K1000K008_Densityratio_z=K1000K008_alpha_beta.*K1000K008_tz./K1000K008_sz;%%% 计算角度
K1000K008_Densityratio_x=K1000K008_alpha_beta.*K1000K008_tx./K1000K008_sx;%%% 计算角度
K1000K008_Density_grad=(K1000K008_alpha.*K1000K008_tx).^2+(K1000K008_sx.*K1000K008_beta).^2;%%% 计算角度
K1000K008_cov=2.*K1000K008_alpha.*K1000K008_beta.*K1000K008_tx.*K1000K008_sx./...
    [(K1000K008_alpha.*K1000K008_tx).^2+(K1000K008_sx.*K1000K008_beta).^2];%%% 计算协方差
K1000K008_fai_TU_z = atan(K1000K008_Densityratio_z);
K1000K008_fai_TU_x = atan(K1000K008_Densityratio_x);
end

%% plot (0-mixed）
x1=-pi/2:pi/100:pi/2;
for i=1
    
K1000K003_fai_TU_x1=[];
for i=1:length(K1000K003_ML_dens)
hhh=K1000K003_fai_TU_x(1:round(K1000K003_ML_dens(i)),i);
K1000K003_fai_TU_x1=cat(1,K1000K003_fai_TU_x1,hhh);
end
[K1000K003_y1,K1000K003_x1]=ksdensity(K1000K003_fai_TU_x1,x1);

K1000K004_fai_TU_x1=[];
for i=1:length(K1000K004_ML_dens)
hhh=K1000K004_fai_TU_x(1:round(K1000K004_ML_dens(i)),i);
K1000K004_fai_TU_x1=cat(1,K1000K004_fai_TU_x1,hhh);
end
[K1000K004_y1,K1000K004_x1]=ksdensity(K1000K004_fai_TU_x1,x1);

K1000K005_fai_TU_x1=[];
for i=1:length(K1000K005_ML_dens)
hhh=K1000K005_fai_TU_x(1:round(K1000K005_ML_dens(i)),i);
K1000K005_fai_TU_x1=cat(1,K1000K005_fai_TU_x1,hhh);
end
[K1000K005_y1,K1000K005_x1]=ksdensity(K1000K005_fai_TU_x1,x1);


K1000K007_fai_TU_x1=[];
for i=1:length(K1000K007_ML_dens)
hhh=K1000K007_fai_TU_x(1:round(K1000K007_ML_dens(i)),i);
K1000K007_fai_TU_x1=cat(1,K1000K007_fai_TU_x1,hhh);
end
[K1000K007_y1,K1000K007_x1]=ksdensity(K1000K007_fai_TU_x1,x1);


K1000K008_fai_TU_x1=[];
for i=1:length(K1000K008_ML_dens)
hhh=K1000K008_fai_TU_x(1:round(K1000K008_ML_dens(i)),i);
K1000K008_fai_TU_x1=cat(1,K1000K008_fai_TU_x1,hhh);
end
[K1000K008_y1,K1000K008_x1]=ksdensity(K1000K008_fai_TU_x1,x1);


K1000J008_fai_TU_x1=[];
for i=1:length(K1000J008_ML_dens)
hhh=K1000J008_fai_TU_x(1:round(K1000J008_ML_dens(i)),i);
K1000J008_fai_TU_x1=cat(1,K1000J008_fai_TU_x1,hhh);
end
[K1000J008_y1,K1000J008_x1]=ksdensity(K1000J008_fai_TU_x1,x1);


K1000J007_fai_TU_x1=[];
for i=1:length(K1000J007_ML_dens)
hhh=K1000J007_fai_TU_x(1:round(K1000J007_ML_dens(i)),i);
K1000J007_fai_TU_x1=cat(1,K1000J007_fai_TU_x1,hhh);
end
[K1000J007_y1,K1000J007_x1]=ksdensity(K1000J007_fai_TU_x1,x1);


K1000J005_fai_TU_x1=[];
for i=1:length(K1000J005_ML_dens)
hhh=K1000J005_fai_TU_x(1:round(K1000J005_ML_dens(i)),i);
K1000J005_fai_TU_x1=cat(1,K1000J005_fai_TU_x1,hhh);
end
[K1000J005_y1,K1000J005_x1]=ksdensity(K1000J005_fai_TU_x1,x1);


K1000J003_fai_TU_x1=[];
for i=1:length(K1000J003_ML_dens)
hhh=K1000J003_fai_TU_x(1:round(K1000J003_ML_dens(i)),i);
K1000J003_fai_TU_x1=cat(1,K1000J003_fai_TU_x1,hhh);
end
[K1000J003_y1,K1000J003_x1]=ksdensity(K1000J003_fai_TU_x1,x1);


K300K004_fai_TU_x1=[];
for i=1:length(K300K004_ML_dens)
hhh=K300K004_fai_TU_x(1:round(K300K004_ML_dens(i)),i);
K300K004_fai_TU_x1=cat(1,K300K004_fai_TU_x1,hhh);
end
[K300K004_y1,K300K004_x1]=ksdensity(K300K004_fai_TU_x1,x1);


K300K003_fai_TU_x1=[];
for i=1:length(K300K003_ML_dens)
hhh=K300K003_fai_TU_x(1:round(K300K003_ML_dens(i)),i);
K300K003_fai_TU_x1=cat(1,K300K003_fai_TU_x1,hhh);
end
[K300K003_y1,K300K003_x1]=ksdensity(K300K003_fai_TU_x1,x1);


K300K001_fai_TU_x1=[];
for i=1:length(K300K001_ML_dens)
hhh=K300K001_fai_TU_x(1:round(K300K001_ML_dens(i)),i);
K300K001_fai_TU_x1=cat(1,K300K001_fai_TU_x1,hhh);
end
[K300K001_y1,K300K001_x1]=ksdensity(K300K001_fai_TU_x1,x1);

end

for jj=1
figure
h1=plot(x1,K300K001_y1,'linewidth',3,'color',[.6 0.19 0.98])
hold on
h2=plot(x1,K300K003_y1,'linewidth',3,'color',[1 0.71 0.75])
hold on
h3=plot(x1,K300K004_y1,'linewidth',3,'color',[1 0.41 0.70])
hold on
h4=plot(x1,K1000K003_y1,'linewidth',3,'color',[.74 0.71 0.41])
hold on
h5=plot(x1,K1000K004_y1,'linewidth',3,'color',[1 1 0])
hold on
h6=plot(x1,K1000K005_y1,'linewidth',3,'color',[.23 0.70 0.44])
hold on
h7=plot(x1,K1000K007_y1,'linewidth',3,'color',[.73 0.56 0.56])
hold on
h8=plot(x1,K1000K008_y1,'linewidth',3,'color',[1 0.64 0])
hold on
h9=plot(x1,K1000J003_y1,'linewidth',3,'color',[.27 0.50 0.70])
hold on
h10=plot(x1,K1000J005_y1,'linewidth',3,'color',[0 1 1])
hold on
h11=plot(x1,K1000J007_y1,'linewidth',3,'color',[.5 0.5 0.5])
hold on
h12=plot(x1,K1000J008_y1,'linewidth',3,'color',[0 0 1])
hold on
[led,objh]=legend([h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12],{'300K001','300K003','300K004',...
    '1000K003','1000K004','1000K005','1000K007','1000K008',...
    '1000J003','1000J005','1000J007','1000J008'},'FontSize',20,'TextColor','k'...
    ,'Location','northeast','NumColumns',2);
hold on
line([-pi/4 -pi/4],[0 3],'Color','k','LineStyle','--','linewidth',3)
hold on
line([pi/4 pi/4],[0 3],'Color','k','LineStyle','--','linewidth',3)
hold on
line([0 0],[0 3],'Color','k','LineStyle','--','linewidth',3)
set(gca,'xtick',[-pi/2:pi/4:pi/2],'xlim',[-pi/2 pi/2],...
     'xticklabel',({'-\pi/2', '-\pi/4' ,'0' ,'\pi/4' ,'\pi/2'}),'tickdir','in');
set(gca,'ylim',[0 0.8])
set(gca,'YTick',[0:0.2:0.8]);
xlim([-pi/2 pi/2])
set(gca,'linewidth',3,'box','on','fontsize',30)

end

%% plot (mixed-200m）
x1=-pi/2:pi/100:pi/2;
for i=1
    
K1000K003_fai_TU_x1=[];
for i=1:length(K1000K003_ML_dens)
hhh=K1000K003_fai_TU_x(round(K1000K003_ML_dens(i)):200,i);
K1000K003_fai_TU_x1=cat(1,K1000K003_fai_TU_x1,hhh);
end
[K1000K003_y1,K1000K003_x1]=ksdensity(K1000K003_fai_TU_x1,x1);

K1000K004_fai_TU_x1=[];
for i=1:length(K1000K004_ML_dens)
hhh=K1000K004_fai_TU_x(round(K1000K004_ML_dens(i)):200,i);
K1000K004_fai_TU_x1=cat(1,K1000K004_fai_TU_x1,hhh);
end
[K1000K004_y1,K1000K004_x1]=ksdensity(K1000K004_fai_TU_x1,x1);

K1000K005_fai_TU_x1=[];
for i=1:length(K1000K005_ML_dens)
hhh=K1000K005_fai_TU_x(round(K1000K005_ML_dens(i)):200,i);
K1000K005_fai_TU_x1=cat(1,K1000K005_fai_TU_x1,hhh);
end
[K1000K005_y1,K1000K005_x1]=ksdensity(K1000K005_fai_TU_x1,x1);


K1000K007_fai_TU_x1=[];
for i=1:length(K1000K007_ML_dens)
hhh=K1000K007_fai_TU_x(round(K1000K007_ML_dens(i)):200,i);
K1000K007_fai_TU_x1=cat(1,K1000K007_fai_TU_x1,hhh);
end
[K1000K007_y1,K1000K007_x1]=ksdensity(K1000K007_fai_TU_x1,x1);


K1000K008_fai_TU_x1=[];
for i=1:length(K1000K008_ML_dens)
hhh=K1000K008_fai_TU_x(round(K1000K008_ML_dens(i)):200,i);
K1000K008_fai_TU_x1=cat(1,K1000K008_fai_TU_x1,hhh);
end
[K1000K008_y1,K1000K008_x1]=ksdensity(K1000K008_fai_TU_x1,x1);


K1000J008_fai_TU_x1=[];
for i=1:length(K1000J008_ML_dens)
hhh=K1000J008_fai_TU_x(round(K1000J008_ML_dens(i)):200,i);
K1000J008_fai_TU_x1=cat(1,K1000J008_fai_TU_x1,hhh);
end
[K1000J008_y1,K1000J008_x1]=ksdensity(K1000J008_fai_TU_x1,x1);


K1000J007_fai_TU_x1=[];
for i=1:length(K1000J007_ML_dens)
hhh=K1000J007_fai_TU_x(round(K1000J007_ML_dens(i)):200,i);
K1000J007_fai_TU_x1=cat(1,K1000J007_fai_TU_x1,hhh);
end
[K1000J007_y1,K1000J007_x1]=ksdensity(K1000J007_fai_TU_x1,x1);


K1000J005_fai_TU_x1=[];
for i=1:length(K1000J005_ML_dens)
hhh=K1000J005_fai_TU_x(round(K1000J005_ML_dens(i)):200,i);
K1000J005_fai_TU_x1=cat(1,K1000J005_fai_TU_x1,hhh);
end
[K1000J005_y1,K1000J005_x1]=ksdensity(K1000J005_fai_TU_x1,x1);


K1000J003_fai_TU_x1=[];
for i=1:length(K1000J003_ML_dens)
hhh=K1000J003_fai_TU_x(round(K1000J003_ML_dens(i)):200,i);
K1000J003_fai_TU_x1=cat(1,K1000J003_fai_TU_x1,hhh);
end
[K1000J003_y1,K1000J003_x1]=ksdensity(K1000J003_fai_TU_x1,x1);


K300K004_fai_TU_x1=[];
for i=1:length(K300K004_ML_dens)
hhh=K300K004_fai_TU_x(round(K300K004_ML_dens(i)):200,i);
K300K004_fai_TU_x1=cat(1,K300K004_fai_TU_x1,hhh);
end
[K300K004_y1,K300K004_x1]=ksdensity(K300K004_fai_TU_x1,x1);


K300K003_fai_TU_x1=[];
for i=1:length(K300K003_ML_dens)
hhh=K300K003_fai_TU_x(round(K300K003_ML_dens(i)):200,i);
K300K003_fai_TU_x1=cat(1,K300K003_fai_TU_x1,hhh);
end
[K300K003_y1,K300K003_x1]=ksdensity(K300K003_fai_TU_x1,x1);


K300K001_fai_TU_x1=[];
for i=1:length(K300K001_ML_dens)
hhh=K300K001_fai_TU_x(round(K300K001_ML_dens(i)):200,i);
K300K001_fai_TU_x1=cat(1,K300K001_fai_TU_x1,hhh);
end
[K300K001_y1,K300K001_x1]=ksdensity(K300K001_fai_TU_x1,x1);
end


for jj=1
figure
h1=plot(x1,K300K001_y1,'linewidth',3,'color',[.6 0.19 0.98])
hold on
h2=plot(x1,K300K003_y1,'linewidth',3,'color',[1 0.71 0.75])
hold on
h3=plot(x1,K300K004_y1,'linewidth',3,'color',[1 0.41 0.70])
hold on
h4=plot(x1,K1000K003_y1,'linewidth',3,'color',[.74 0.71 0.41])
hold on
h5=plot(x1,K1000K004_y1,'linewidth',3,'color',[1 1 0])
hold on
h6=plot(x1,K1000K005_y1,'linewidth',3,'color',[.23 0.70 0.44])
hold on
h7=plot(x1,K1000K007_y1,'linewidth',3,'color',[.73 0.56 0.56])
hold on
h8=plot(x1,K1000K008_y1,'linewidth',3,'color',[1 0.64 0])
hold on
h9=plot(x1,K1000J003_y1,'linewidth',3,'color',[.27 0.50 0.70])
hold on
h10=plot(x1,K1000J005_y1,'linewidth',3,'color',[0 1 1])
hold on
h11=plot(x1,K1000J007_y1,'linewidth',3,'color',[.5 0.5 0.5])
hold on
h12=plot(x1,K1000J008_y1,'linewidth',3,'color',[0 0 1])
hold on
[led,objh]=legend([h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12],{'300K001','300K003','300K004',...
    '1000K003','1000K004','1000K005','1000K007','1000K008',...
    '1000J003','1000J005','1000J007','1000J008'},'FontSize',20,'TextColor','k'...
    ,'Location','northeast','NumColumns',2);
hold on
line([-pi/4 -pi/4],[0 3],'Color','k','LineStyle','--','linewidth',3)
hold on
line([pi/4 pi/4],[0 3],'Color','k','LineStyle','--','linewidth',3)
hold on
line([0 0],[0 3],'Color','k','LineStyle','--','linewidth',3)
set(gca,'xtick',[-pi/2:pi/4:pi/2],'xlim',[-pi/2 pi/2],...
     'xticklabel',({'-\pi/2', '-\pi/4' ,'0' ,'\pi/4' ,'\pi/2'}),'tickdir','in');
set(gca,'ylim',[0 2])
set(gca,'YTick',[0:0.5:2]);
xlim([-pi/2 pi/2])
set(gca,'linewidth',3,'box','on','fontsize',30)
end

