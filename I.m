%Definimos la función intensidad de distintas fromas
function [I]= I (t)

% %%Pulso constante
% I=-0.5;

% %Pequeño impulso al principio y vuelta a la normalidad
% if t<10 
%     I=-0.145;
% else
%     I=0;
% end

%Rampa 
% if t<450
% I=0.1*t+5;
% else
%     I=0;
% end

%Parametrizamos la recta que me vaya desde una corriente de 0 hasta el
%valor deseado según el tiempo de iteración
a1=-1.8876/6000;
I=-5.13*10^(-4)*t;


% %Un único pulso
% if t>20&&t<40
%     I=-2.6;
% else
%     I=0;
% end

% %Pulsos de distintas intensidades
% if  t>50 && t<=100
%     I=0;
% elseif t>100 && t<=150
%     I=-0.1;
% elseif t>150 && t<=200
%     I=0;
% elseif t>200 && t<=250
%     I=-0.2;
% elseif t>250 && t<=300
%     I=0;
% elseif t>300 && t<=350
%     I=-0.4;
% elseif t>350 && t<=400
%     I=0;
% elseif t>400 && t<=450
%     I=-0.5;
% elseif t>450 && t<=500
%     I=0;
% elseif t>500 && t<=550
%     I=-1.2;    
% elseif t>550 && t<=600
%     I=0;    
% elseif t>600 && t<=650
%     I=-1.4;
% elseif t>650 && t<=700
%     I=0;    
% elseif t>700 && t<=750
%     I=-1.6;    
% elseif t>750 && t<800
%     I=0;   
% elseif t>800 && t<=850
%     I=-1.8;    
%     
% else 
%     I=0;
% end

% %Pulsos de la misma intensidad equiespaciados
% I=0;
% I0=3; %La intensidad que quiero que tengan los pulsos
% t0=0;
% tf=100; %Intervalo de tiempos donde quiero que se transmitan los pulsos
% N=31; %nº de intervalos de tiempo que quiero (e nº de pulsos será N-1/2)
% h=(tf-t0)/N; %Duración de cada intervalo
% i=1; %Contador de intervalos donde estamos
% while i<=N
%     if mod(i,2)==0 && t<=i*h && t>=(i-1)*h
%         I=I0;
%     end
%     i=i+1;
% end

end
