function [y5] = beamwarming(deltaT,tempo,aux,deltaX,cinj,cini,newVet,oldVet,u,divEspaco,vetorEspaco,deltaTMAX)
tic
TempoProcessamento = 0;
%Courant = u*(deltaT/deltaX);
%Courant = 0.9;
while aux < tempo
     if (aux>tempo/2)
         cini = cinj;
     end
    newVet(1) = oldVet(1) - ((deltaT/deltaX)*(u*2*(oldVet(1)-cini)));
    newVet(2) = oldVet(2) - ((deltaT/deltaX)*(u*2*(oldVet(2)-cini)));
    for j = 3:divEspaco-1
        newVet(j) = oldVet(j) - u*(deltaT/(2*deltaX))*(3*oldVet(j) - 4*oldVet(j-1)+ oldVet(j-2)) + ((u^2)*(deltaT^2))/(2*deltaX^2)*(oldVet(j)-2*oldVet(j-1)+oldVet(j-2))
    end
    oldVet=newVet;
    aux = aux + deltaT;
    newVet(divEspaco) = oldVet(divEspaco) - (deltaT/deltaX) *(u*(oldVet(divEspaco) - oldVet(divEspaco-1))); %Contorno Direito
end
    for k =1:divEspaco
        y5(k) = newVet(k);
    end
    
plot(vetorEspaco, newVet,'g');
title("Equação de Advecção-Difusão BEAMWARMING");
grid on
hold on
texto_anotacao = sprintf('DeltaT: %.3f\nDeltaTMAX: %.3f', deltaT, deltaTMAX);
annotation('textbox',[0.63,0.2,0.2,0.7] ,'String',texto_anotacao,'FitBoxToText','on');
xlabel("Lx");
ylabel("Concentração"); 


%Plot sem anotacao para varios graficos (Necessario ir mudando a cor
%manualmente e os parametros no arquivo novaEntradaDados.m manualmente
%e comentar o plot de cima
% plot(vetorEspaco, newVet,'g');
% title("Equação de Advecção-Difusão BEAMWARMING");
% grid on
% hold on
% xlabel("Lx");
% ylabel("Concentração");


TempoProcessamento = toc
end