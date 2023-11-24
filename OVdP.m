[x,y]=meshgrid(-3:0.5:3,-3:0.5:3);
mu=1;

xdot=y;
ydot=mu*(1-x.^2).*y-x;

quiver(x,y,xdot,ydot,'LineWidth',2)
xnu=@(a) 0;
ynu=@(a) a/(mu*(1-a^2));
hold on
fplot(xnu,[-3 3],'--','LineWidth',1.5,'Color',"#77AC30")
fplot(ynu,[-3 3],'--','LineWidth',1.5,'Color',"#4DBEEE")
plot(0,0,'ko','MarkerFaceColor','w','MarkerSize',10)
xlim([-3 3])
ylim([-3 3])
legend('Campo de direcciones','x-nulclina','y-nulclina','Eguilibiro','Location','southeast','FontSize',12)
xline(-3,'HandleVisibility','off')
xline(3,'HandleVisibility','off')
yline(3,'HandleVisibility','off')
yline(-3,'HandleVisibility','off')
axis off
hold off