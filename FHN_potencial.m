%Vamos a representar la evolución del potencial de membrana junto con la
%intensidad de corriente

%Establecemos un intervalo de tiempos y una condición inicial con los que
%resolveremos el sistema

t0=-50; tf=6000;
Vw0=[1.1994,-0.6243];%lo iniciamos en el euilibrio estable que encontramos con el 
%programa de simulacion_FHN
[t,y]=ode45(@FHN,[t0 tf],Vw0);
subplot(2,1,1)
plot(t,y(:,1),'Color',"#0072BD")
xlabel('Tiempo','FontSize',20)
ylabel('Potencial de membrana, V','FontSize',20)
hold on
m=min(y(:,1)); %Definimos el mínimo del potencial de membrana
M=max(y(:,1)); %Definimos el máximo del potencial de membrana
ylim([m-0.5 M+0.5])
xlim([500 3200])
hold off


%Para dibujar correctamente la intensidad deberemos definirla en vector
%almacenando sus valores 1 a 1
I=@(t) I(t); %Definimos I como una función del tiempo
Idib=zeros(1,length(t)); %Creamos el vector donde iremos almacenando los valores de I
for i=1:length(t) 
    Idib(i)=I(t(i));
end
subplot(2,1,2)
plot(t,Idib,'LineWidth',2,'Color',"#0072BD")
xlabel('Tiempo','FontSize',20)
ylabel('Intensidad de corriente, I','FontSize',20)
ylim([min(Idib)-2 max(Idib)+2])
xlim([500 3200])

hold off