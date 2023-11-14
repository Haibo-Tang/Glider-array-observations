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
xlim([117.5 120.5])
ylim([19.5 22.5])
xticklabels([118 119 120])
yticklabels([20 21 22])
end