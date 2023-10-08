%% Variaveis e funções
cinj = 2;
cini = 15;
% ca = 3;
% cb = 4;
Lx = 9;
alfa = 0.0008;
tempo = 1000;
divEspaco = 200;
divTempo = 80;
u = 0.0001;
deltaX = Lx / divEspaco; % Número de divisões espaciais.
deltaT = tempo / divTempo;  % Número de divisões temporais.
aux = 0; % Definindo aux = 0 globalmente.
vetorEspaco = zeros(1,divEspaco); % Inicializando vetor da malha espacial.
oldVet = zeros(1,divEspaco); % Inicializando vetor da concentração antiga.
newVet = zeros(1,divEspaco); % Inicializando vetor da concentração nova.

for i = 2:divEspaco
    vetorEspaco(i) = vetorEspaco(i-1) + deltaX; % Preenchendo a malha começando do i=2 por causa da condição de contorno
end

% Preencher o vetor com as condições iniciais, no while ele vai substituir
% os valores que não sejam o indice 1.
% for i = 1:divEspaco
%     oldVet(i)=cini;
%     newVet(i)=cini;
% end

%oldVet(1) = cini; % Condição inicial no indice 1.
%newVet(1) = cini; % Condição inicial no indice 1.
