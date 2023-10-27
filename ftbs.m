function [y2] = ftbs(deltaT,tempo,aux,deltaX,cinj,cini,alfa,newVet,oldVet,u,divEspaco,vetorEspaco,deltaTMAX)
tic
alfa = 0;
while aux < tempo
% 
%       if (aux>tempo/2)
%           cini = 20;
%       end
    newVet(1) = oldVet(1) - ((deltaT/deltaX)*(u*2*(oldVet(1)-cini)) - alfa*((oldVet(2)-3*oldVet(1)+2*cini)/deltaX));
    for j = 2:divEspaco-1
        newVet(j) = oldVet(j) - (deltaT/deltaX) *(u)*(oldVet(j) - oldVet(j - 1)) - (alfa) *((oldVet(j + 1) - 2 * oldVet(j) + oldVet(j - 1))/deltaX);
    end
    oldVet=newVet;
    aux = aux + deltaT;
end
%TO DO CONTORNO DIREITO
    for k =1:divEspaco-1
        y2(k) = newVet(k);
    end
plot(vetorEspaco, newVet,'g');
title("Equação de Advecção-Difusão");
grid on
hold on
texto_anotacao = sprintf('DeltaT: %.3f\nDeltaTMAX: %.3f', deltaT, deltaTMAX);
annotation('textbox',[0.65,0.2,0.2,0.7] ,'String',texto_anotacao,'FitBoxToText','on');
xlabel("Lx");
ylabel("Concentração");
toc
end