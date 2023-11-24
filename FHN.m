function [Vw]= FHN (t,P)

%Parametros de entrada:
    %P: vector fila con los parametros de las ecuaciones diferenciales del
    %potencial de membrana y w
    %t: está incluida para que funcione ode45
%Parametros de salida:
    %Vw: vector columna que contiene las derivadas de V y w
    %respectivamente
    
    %Damos valores a los parámetros que aparecen en las ecuaciones.
    %Recordar cambiarlos y que concuerden con los que se usan en la
    %representación
    
%la intensidad de corriente se obtiene del script que la modela    
    
a=0.7;
b=0.8;
ep=0.08;

%Definimos un vector columna con las derivadas
Vw=[P(2)-P(1)^3/3+P(1)+I(t),-ep*(P(1)-a+b*P(2))]';
end 
