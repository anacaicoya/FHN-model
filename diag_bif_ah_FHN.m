ep=0.08;
%Definimos los límites donde ocurre la bif de hopf
l1=-1/ep^(1/2);
l2=1/ep^(1/2);

%Frontera bifurcacion nodo silla
an1=@(b) ((b-1)/b)^(1/2)*((b-1)/3-b+1);
an2=@(b) -((b-1)/b)^(1/2)*((b-1)/3-b+1);

%Frontera bifurcación de hopf
I=-1.4187;
ah1=@(b) (1-ep*b)^(1/2)*((b-ep*b^2)/3+1-b)-I*b;
ah2=@(b) -(1-ep*b)^(1/2)*((b-ep*b^2)/3+1-b)-I*b;

%fplot(an1,[l1 l2],'Color',"#0072BD",'LineWidth',2)
hold on
%fplot(an2,[l1 l2],'Color',"#0072BD",'HandleVisibility','off','LineWidth',1)
fplot(ah1,[l1 l2],'Color',"#D95319",'LineWidth',2.5)
hold on
fplot(ah2,[l1 l2],'Color',"#D95319",'HandleVisibility','off','LineWidth',2.5)

%Vamos a dibujar ahora la región permitida por FitzHugh
%Condición sobre a junto a que sea mayor que 0 y menor que 1
fa=@(b)1-2*b/3;

%Condición b<1
x1=ones(1,1000);
y1=linspace(1/3,1,1000);

%Condición a<1
x2=linspace(0,1,1000);
y2=ones(1,1000);
fplot(fa,[0 1],'Color',	"#77AC30",'Linewidth',2)
hold on
plot(x1,y1,'Color',	"#77AC30",'Linewidth',2,'HandleVisibility','off')
plot(x2,y2,'Color',	"#77AC30",'Linewidth',2,'HandleVisibility','off')
x=0.8; y=0.7;
plot(x,y,'k.','MarkerSize',40)
%legend('Región delimitada por FitzHugh','Caso particular','FontSize',20,'Location','southwest')


legend('Bifurcación de Andronov-Hopf','Región delimitada por FitzHugh','Caso particular','FontSize',20,'location','southwest')
xlabel('b','FontSize',20)
ylabel('a','Fontsize',20)
set(gca, 'FontSize', 20)
xlim([-0.2 1.2])
ylim([0.2 1.2])

hold off