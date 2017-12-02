%% Universidade de Brasilia
% Departamento de Ciencia de Computacao
% Principios de Visao Computacional
% 2/2017

% Filipe Teixeira 14/0139486
% Lucas Santos 14/0151010

%% Projeto Final - Deteccao Rosto

% Obtendo o diretorio das imagens a serem utilizadas 
cd('input_dasp\');

% Obtendo o diretorio atual 
diretorio = dir;

% Pre alocando a imagem binaria
BW{length(diretorio)} = zeros(512, 512);

% Pre alocando a imagem binaria maior elemento
BW2{length(diretorio)} = zeros(512, 512);

% Percorrendo o diretorio das imagens 
for num = 3:length(diretorio)
    % Passa a imagem para binario
    BW{num-2} = imbinarize(imagem_binarizada{num-2});
    
    %TODO Filtra os maiores elementos da imagem
    BW2{num-2} = bwareafilt(BW{num-2}, [200 500]);
    figure(); imshow(BW2{num-2});
    pause;
    
end % for %

% Retornando ao diretorio inicial 
cd(diretorio_inicial);