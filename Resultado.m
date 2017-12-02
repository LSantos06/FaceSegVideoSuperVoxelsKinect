%% Universidade de Brasilia
% Departamento de Ciencia de Computacao
% Principios de Visao Computacional
% 2/2017

% Filipe Teixeira 14/0139486
% Lucas Santos 14/0151010

%% Projeto Final - Resultado

% Obtendo o diretorio das imagens a serem utilizadas 
cd('output_frames\');

% Obtendo o diretorio atual 
diretorio = dir;

% Pre alocando a imagem binaria com a deteccao final
imagem_final{length(diretorio)} = zeros(512, 512);

% Percorrendo o diretorio das imagens, exceto os .mat
for num = 3:(length(diretorio)-6)
    % Lendo as imagens do diretorio, o num-2 eh utilizado, pois os
    % primeiros parametros retornados pela funcao dir sao '.' e '..', que nao
    % sao relevantes no contexto do software 
    imagem_final{num-2} = imread(diretorio(num).name);
    
    % Redimensionando a imagem para 512x512 
    imagem_final{num-2} = imresize(imagem_final{num-2}, [512 512]);    
    
    % Percorrendo a imagem 
    for lin = 1:linhas
        for col = 1:colunas
            % Se o pixel estiver no intervalo determinado, tanto no cb,
            % quanto no cr, o tal pixel na imagem binarizada recebe o
            % valor 1 e vermelho na imagem original 
            if(imagem_deteccao{num-2}(lin, col))               
                imagem_final{num-2}(lin, col, 1) = 255;
                imagem_final{num-2}(lin, col, 2) = 0;
                imagem_final{num-2}(lin, col, 3) = 0;
            end % if %
        end % for %
    end % for %
    
    % Resultado final na imagem original
    imshow(imagem_final{num-2});
    pause;
    
end % for %

% Retornando ao diretorio inicial 
cd(diretorio_inicial);