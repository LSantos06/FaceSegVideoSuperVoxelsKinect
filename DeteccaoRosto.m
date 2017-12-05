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
imagem_morfo{length(diretorio)} = zeros(512, 512);

% Pre alocando a imagem binaria morfologica
imagem_bordas{length(diretorio)} = zeros(512, 512);

% Pre alocando a imagem binaria com a deteccao final
imagem_deteccao{length(diretorio)} = zeros(512, 512);

% Percorrendo o diretorio das imagens 
for num = 3:length(diretorio)
    % imagem binarizada
    figure(); imshow(imagem_binarizada{num-2});
    % Escrita da imagem
    %imwrite(imagem_binarizada{num-2},sprintf('_%d.jpg',num));
    pause;
    
    % Operacoes morfologicas para facilitar a deteccao da face
    se = strel('square', 2);
    imagem_morfo{num-2} = imerode(imagem_binarizada{num-2}, se);  
    %figure(); imshow(imagem_morfo{num-2});
    %pause;
    se = strel('square', 20);
    imagem_morfo{num-2} = imdilate(imagem_morfo{num-2}, se);   
    %figure(); imshow(imagem_morfo{num-2});
    %pause;
    
    % Deteccao de bordas
    imagem_bordas{num-2} = edge(imagem_morfo{num-2},'Canny',[]);    
    %figure(); imshow(imagem_bordas{num-2});
    %pause;
    
    % Obtem os componentes conectados com maior exentricidade (mais chance
    % de ser um rosto)
    imagem_deteccao{num-2} = bwareaopen(imagem_bordas{num-2}, 20); 
    imagem_deteccao{num-2} = bwpropfilt(imagem_deteccao{num-2}, 'Eccentricity', [0.8 1]);
    figure(); imshow(imagem_deteccao{num-2});
    % Escrita da imagem
    %imwrite(imagem_deteccao{num-2},sprintf('%d.jpg',num));
    pause;    
    
end % for %

% Retornando ao diretorio inicial 
cd(diretorio_inicial);