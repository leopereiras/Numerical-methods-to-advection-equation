function [y2] = ftbs(deltaT,tempo,aux,deltaX,cinj,cini,alfa,newVet,oldVet,u,divEspaco,vetorEspaco)
    alfa = 0;
while aux < tempo
 
%      if (aux>tempo/2)
%          cini = 10;
%      end
    newVet(1) = oldVet(1) - ((deltaT/deltaX)*(u*2*(oldVet(1)-cini)) - alfa*((oldVet(2)-3*oldVet(1)+2*cini)/deltaX));
    for j = 2:divEspaco-1
        newVet(j) = oldVet(j) - (deltaT/deltaX) *(u)*(oldVet(j) - oldVet(j - 1)) - (alfa) *((oldVet(j + 1) - 2 * oldVet(j) + oldVet(j - 1))/deltaX);
    end
    oldVet=newVet
    aux = aux + deltaT;
end
    for k =1:divEspaco-1
        y2(k) = newVet(k);
    end
    
plot(vetorEspaco, newVet,'r');
hold on
title("Equação de Advecção-Difusão");
xlabel("Lx");
ylabel("Concentração"); 
end