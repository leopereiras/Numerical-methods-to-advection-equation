function [y5] = beamwarming(deltaT,tempo,aux,deltaX,cinj,cini,alfa,newVet,oldVet,u,divEspaco,vetorEspaco,deltaTMAX)

%Courant = u*(deltaT/deltaX);
%Courant = 0.9;
while aux < tempo
 
     if (aux>tempo/2)
         cini = 10;
     end

    %newVet(1) = oldVet(1) - ((deltaT/deltaX)*(u*2*(oldVet(1)-cini)) - alfa*((oldVet(2)-3*oldVet(1)+2*cini)/deltaX));
    newVet(1) = oldVet(1) - (deltaT/deltaX)*(u*2*(oldVet(1)-cini));
    newVet(2) = oldVet(2) - (deltaT/deltaX)*(u*2*(oldVet(2)-cini));
    for j = 3:divEspaco-1
        newVet(j) = (oldVet(j) - u*(deltaT/(2*deltaX))*(3*oldVet(j) - 4*oldVet(j-1)+ oldVet(j-2)) + ((u^2)*(deltaT^2))/(2*deltaX^2)*(oldVet(j)-2*oldVet(j-1)+oldVet(j-2)))
    end
    oldVet=newVet;
    aux = aux + deltaT;
end
    for k =1:divEspaco-1
        y5(k) = newVet(k);
    end
    
plot(vetorEspaco, newVet,'g');
title("Equação de Advecção-Difusão");
grid on
hold on
texto_anotacao = sprintf('DeltaT: %.3f\nDeltaTMAX: %.3f', deltaT, deltaTMAX);
annotation('textbox',[0.65,0.2,0.2,0.7] ,'String',texto_anotacao,'FitBoxToText','on');
xlabel("Lx");
ylabel("Concentração"); 

end