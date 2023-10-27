function [y2] = ftbs(deltaT,tempo,aux,deltaX,cinj,cini,newVet,oldVet,u,divEspaco,vetorEspaco,deltaTMAX)
tic
alfa = 0;
TempoProcessamento = 0;
while aux < tempo 
      if (aux>tempo/2)
          cini = cinj;
      end
    newVet(1) = oldVet(1) - ((deltaT/deltaX)*(u*2*(oldVet(1)-cini)) - alfa*((oldVet(2)-3*oldVet(1)+2*cini)/deltaX)); %Contorno Esquerdo
    for j = 2:divEspaco-1
        newVet(j) = oldVet(j) - (deltaT/deltaX) *((u)*(oldVet(j) - oldVet(j - 1)) - (alfa) *((oldVet(j + 1) - 2 * oldVet(j) + oldVet(j - 1))/deltaX));
    end
    oldVet=newVet;
    aux = aux + deltaT;
    newVet(divEspaco) = oldVet(divEspaco) - (deltaT/deltaX) *(u*(oldVet(divEspaco) - oldVet(divEspaco-1)) - alfa* (-oldVet(divEspaco) + oldVet(divEspaco-1))/deltaX); %Contorno Direito
end
    
    for k =1:divEspaco
        y2(k) = newVet(k);
    end
plot(vetorEspaco, newVet,'g');
title("Equação de Advecção-Difusão FTBS");
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
% title("Equação de Advecção-Difusão FTBS");
% grid on
% hold on
% xlabel("Lx");
% ylabel("Concentração");


TempoProcessamento = toc
end