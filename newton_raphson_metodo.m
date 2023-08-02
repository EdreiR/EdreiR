close all;
clear;
clc;

x='1/x';%ecuación no lineal de una incógnita
x1=2;%Valor inicial para Newton-Raphson
t=-50:0.01:50;%Valoresdel eje x para graficar
it=1;% Número de veces que se ha repetido el proceso
x=str2sym(x);% Convierte de texto a símbolo a la ecuación
p=inline(x);% prepara a la ecuación para ser evaluada
fx(it)=p(x1);% Evalúa a la ecuación en el valor incial x1
dx=diff(x);% primera derivada de la ecuación
fpx=inline(dx);% Prepara la primera derivada de la ecuación para ser evaluada
y=p(t);%Valores del eje y para graficar
plot(t,y,'.r');hold on; plot(x1,fx(it),'ok');

xk(it)=x1;% Valor kaésimo de x
while (round(fx,10)~=0)
    it=it+1; %Actuliza el conteo de número de veces que se ha repetido el proceso
    xk(it)=xk(it-1)-(p(xk(it-1))/fpx(xk(it-1)));% Fórmula de Newton-Raphson
    fx(it)=p(xk(it)),% Actualiza los valores de fx
    hold on;plot(xk(it),fx(it),'ok');% grafica las posibles soluciones
    drawnow;%Dibujalo ahora
    pause(1);% Espera n segundos   
end


