In=-0.5; %este valor debe cuadrar con el del script I

a=0.7;
b=0.8;
ep=0.08;
[V,w]=meshgrid(-3:0.3:3,-2:0.3:4);
DV=w-V.^3/3+V+In;
Dw=-ep*(V-a+b*w);

%Creamos un vector que contiene los coeficientes del polinomio de tercer
%grado resultante de igualar las nulclinas para poder calcular sus racies
%y extraemos las que son reales.

p=[1/3;0;1/b-1;-In-a/b] ; 
i=roots(p);
r=i(imag(i)==0); %En principio siempre estamos cumpliendo las condiciones por 
%lo que habrá un único equilibrio real. Este será el valor del potencial
%en el equilibrio

%Calculamos las nulclinas
Vnu=@(x)x.^3/3-x-In;
wnu=@(x)(a-x)/b;


%Definimos un intervalo de tiempos y unas condiciones iniciales para poder 
%resolver el sustema mediante ode45
t0=0; tf=10000;
Vw0=[-0.96 3];
Vw01=[-0.6, 2];
[t1,y]=ode45(@FHN,[t0 tf],Vw0);
[t2,y1]=ode45(@FHN,[t0 tf],Vw01);

Vorb=y(:,1);
worb=y(:,2);

%Reresentamos el retrato de fases con las órbitas positivas y el equilibrio
figure(1)
quiver(V,w,DV,Dw,'LineWidth',1.25,'HandleVisibility','off','Color',"#0072BD")
hold on

fplot(Vnu,[-3,3],'--','LineWidth',2,'HandleVisibility','off','Color',"#D95319")
fplot(wnu,[-3,3],'--','LineWidth',2,'HandleVisibility','off','Color',	"#EDB120")
plot(Vorb,worb,'LineWidth',2, 'Color',"#7E2F8E")
plot(y1(:,1),y1(:,2),'LineWidth',2, 'Color',"#77AC30")
%plot(r,wnu(r),'k.','MarkerSize',40,'HandleVisibility','off')
plot(r,wnu(r),'ko','MarkerSize',15,'MarkerFaceColor','w','LineWidth',1.5,'HandleVisibility','off')
ylim([-2 4])

%legend('Campo de direcciones','V-nulclina','w-nulclina','\gamma_{p_1}^+','\gamma_{p_2}^+','Equilibrio','Location','Southeast','FontSize',10)
legend('\gamma_{p_1}^+','\gamma_{p_2}^+','Location','Southeast','FontSize',25)
xlabel('Potencial de membrana, V')
ylabel('Variable de recuperación, w')
set(gca, 'FontSize', 20)
hold off



% Escribimos una función que representa el discriminante del polinomio
% resultante de igualar las nulclinas y lo representamos para conocer
% su signo. Identificamos la intensidad con la variable z para evitar
% confusiones con el valor que le damos a I al comienzo
disc=@(z) (-4*(1-b)^3-9*b*(a+b*z)^2)/(3*b^2);
% figure(2)
% fplot(disc,[-100,100])
% 
% 
% hold off
v=['Los puntos de interseccion de las nulclinas son', r];
fprintf('Los puntos de interseccion de las nulclinas son\n %s\n %s\n %s\n', num2str(i(1)),num2str(i(2)),num2str(i(3)))


%A continuación hacemos cálculos que nos serán útiles en el estudio

%Obtenemos el valor de V y w para el que la traza de de la matriz jacobiana del
%sistema es nula (bifurcación de Hopf)
V01=-(1-ep*b)^(1/2);
V02=(1-ep*b)^(1/2);

w01=wnu(V01);
w02=wnu(V02);

%Calculamos el valor de la corriente en este punto
int=@(x) x^3/3-x*(1-1/b)-a/b;
I01=int(V01);
I02=int(V02);

%Dibujamos \tau^2-4\Delta y la traza para clasificar los equilibrios

f= @(x) (1-x.^2-ep*b)^2-4*(-(1-x.^2)*ep*b+ep);
tau=@(x)1-x.^2-ep*b;
det=@(x) -(1-x^2)*b*ep+ep;
figure(3)
fplot(f,'LineWidth',3,'Color',"#0072BD")
text(1.5, f(1.5)-0.2, '\tau ^2-4\Delta', 'Color', "#0072BD", 'VerticalAlignment', 'top','FontSize',15);
hold on
fplot(tau,'LineWidth',3,'Color',"#D95319")
text(1.4, tau(1.35), '\tau', 'Color', "#D95319", 'VerticalAlignment', 'top','FontSize',18);

%Dibujamos lineas verticales que nos delimitén las zonas de interés
xline(V01,'LineWidth',1.5)
text(V01+0.01,-0.8,'V_{0,1}','VerticalAlignment', 'top','FontSize',15);

xline(V02,'LineWidth',1.5)
text(V02-0.15,-0.8,'V_{0,2}','VerticalAlignment', 'top','FontSize',15);

yline(0,'LineWidth',1.5)
ylim([-1 1])
xlim([-1.75 1.75])

%Trazamos las lineas que delimitan los entornos de V01
V1=fzero(f,V01-1);
V2=fzero(f,V01+0.05);
xline(V1,'k--','LineWidth',1.5)
text(V1+0.01,-0.8,'V=-1.277','VerticalAlignment', 'top','FontSize',15);
xline(V2,'k--','LineWidth',1.5)
text(V2+0.01,-0.8,'V=-0.706','VerticalAlignment', 'top','FontSize',15);

%Entornos de V02
V3=fzero(f,V02-1);
V4=fzero(f,V02+2);
xline(V3,'k--','LineWidth',1.5)
text(V3-0.23,-0.8,'V=0.706','VerticalAlignment', 'top','FontSize',15);
xline(V4,'k--','LineWidth',1.5)
text(V4-0.23,-0.8,'V=1.277','VerticalAlignment', 'top','FontSize',15);

text(-1.20,0.8,'Zona 1','VerticalAlignment', 'top','FontSize',15);
text(-0.95,0.8,'Zona 2','VerticalAlignment', 'top','FontSize',15);
text(0.75,0.8,'Zona 3','VerticalAlignment', 'top','FontSize',15);
text(1.05,0.8,'Zona 4','VerticalAlignment', 'top','FontSize',15);

xlabel('Potencial de membrana, V','FontSize',20')
hold off

%Vamos a calcular los valores de la intensidad que delimitan cada una de
%las zonas

I1=int(V1);
I2=int(V2);
I3=int(V3);
I4=int(V4);
fprintf('Los potenciales para los que la traza es nula son %d y %d\n',V01,V02)
fprintf('Los w para los que la traza es nula son %d y %d\n',w01,w02)
fprintf('Las corrientes para las que la traza es nula son %d y %d\n',I01,I02)

