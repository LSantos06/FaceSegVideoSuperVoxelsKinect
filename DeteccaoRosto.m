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

% Pre alocando a imagem binaria dilatada
BW2{length(diretorio)} = zeros(512, 512);

% Pre alocando a imagem binaria maior elemento
BW3{length(diretorio)} = zeros(512, 512);

% Pre alocando a imagem binaria maior elemento
stats{length(diretorio)} = zeros(512, 512);

% Percorrendo o diretorio das imagens 
for num = 3:length(diretorio)
    % imagem binarizada
    figure(); imshow(imagem_binarizada{num-2});
    pause;
    
    % Operacoes morfologicas para facilitar a deteccao da face
    se = strel('square', 2);
    BW{num-2} = imerode(imagem_binarizada{num-2}, se);     
    se = strel('square', 20);
    BW{num-2} = imdilate(BW{num-2}, se);          
    
    % Deteccao de bordas
    BW2{num-2} = edge(BW{num-2},'Canny',[]);    
    
    % Obtem os componentes conectados com maior exentricidade (mais chance
    % de ser um rosto)
    BW3{num-2} = bwareaopen(BW2{num-2}, 20); 
    BW3{num-2} = bwpropfilt(BW3{num-2}, 'Eccentricity', [0.8 1]);
    figure(); imshow(BW3{num-2});
    pause;    
    
end % for %

% Retornando ao diretorio inicial 
cd(diretorio_inicial);