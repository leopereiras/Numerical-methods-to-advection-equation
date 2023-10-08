function [y3] = laxfriedrichs(deltaT,tempo,aux,deltaX,cinj,cini,alfa,newVet,oldVet,u,divEspaco,vetorEspaco)
tic
%Courant = u*(deltaT/deltaX);
Courant = 0.9;
while aux < tempo
 
%      if (aux>tempo/2)
%          cini = 10;
%      end

    newVet(1) = oldVet(1) - ((deltaT/deltaX)*(u*2*(oldVet(1)-cini)) - alfa*((oldVet(2)-3*oldVet(1)+2*cini)/deltaX));
    for j = 2:divEspaco-1
        newVet(j) = (oldVet(j+1)+oldVet(j-1))/2 - Courant*(oldVet(j+1) - oldVet(j-1))
    end
    oldVet=newVet;
    aux = aux + deltaT;
end
    for k =1:divEspaco-1
        y3(k) = newVet(k);
    end
    
plot(vetorEspaco, newVet,'g');
hold on
title("Equação de Advecção-Difusão");
xlabel("Lx");
ylabel("Concentração"); 
TempodeProcessamento = toc
end