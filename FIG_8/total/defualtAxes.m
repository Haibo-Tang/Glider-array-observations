function defualtAxes
ax=gca;hold on;box on
ax.XGrid='on';
ax.YGrid='on';
ax.XMinorTick='off';
ax.YMinorTick='off';
ax.LineWidth=2;
ax.GridLineStyle='-.';
ax.FontName='Cambria';
ax.FontSize=25;
axis equal
set(gca,'linewidth',3,'box','on','fontsize',35)
xlim([-1.5 1.5]);ylim([-1.3 1.3]);
set(gca,'ytick',[-1 0 1],'xtick',[-1 0 1],'xticklabels',{'-1R','0','1R'},...)
'yticklabels',{'-1R','0','1R'})
end