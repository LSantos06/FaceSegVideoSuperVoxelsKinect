%% Universidade de Brasilia
% Departamento de Ciencia de Computacao
% Principios de Visao Computacional
% 2/2017

% Filipe Teixeira 14/0139486
% Lucas Santos 14/0151010

%% Projeto Final - Deteccao Pele

% Obtendo o diretorio das imagens a serem utilizadas 
cd('input_dasp\');

% Obtendo o diretorio atual 
diretorio = dir;

% Pre alocando a imagem 
imagem{length(diretorio)} = zeros(512, 512);

% Pre alocando a imagem binarizada 
imagem_binarizada{length(diretorio)} = zeros(512, 512);

% Percorrendo o diretorio das imagens 
for num = 3:length(diretorio)
    % Lendo as imagens do diretorio, o num-2 eh utilizado, pois os
    % primeiros parametros retornados pela funcao dir sao '.' e '..', que nao
    % sao relevantes no contexto do software 
    imagem{num-2} = imread(diretorio(num).name);
    
    % Redimensionando a imagem para 512x512 
    imagem{num-2} = imresize(imagem{num-2}, [512 512]);
    
    % Obtendo o tamanho da imagem 
    [linhas, colunas, dimensao] = size(imagem{num-2});
    % Passando a imagem de rgb para ycbcr 
    imagem{num-2} = rgb2ycbcr(imagem{num-2});

    % Separando as dimensoes da imagem 
    Y = imagem{num-2}(:, :, 1);
    Cb = imagem{num-2}(:, :, 2);
    Cr = imagem{num-2}(:, :, 3);
    
    % Passando a imagem de ycbcr para rgb 
    imagem{num-2} = ycbcr2rgb(imagem{num-2});
    % Guardando a imagem original 
    imagem_pele = imagem{num-2};
    
    % Percorrendo a imagem 
    for lin = 1:linhas
        for col = 1:colunas
            % Se o pixel estiver no intervalo determinado, tanto no cb,
            % quanto no cr, o tal pixel na imagem binarizada recebe o
            % valor 1 e vermelho na imagem original 
            if(((Cb(lin, col) >= intervalo_pele_minimo_cb && Cb(lin, col) <= intervalo_pele_maximo_cb)) && (Cr(lin, col) >= intervalo_pele_minimo_cr && Cr(lin, col) <= intervalo_pele_maximo_cr))
                imagem_binarizada{num-2}(lin, col) = 1;
               
                imagem_pele(lin, col, 1) = 255;
                imagem_pele(lin, col, 2) = 0;
                imagem_pele(lin, col, 3) = 0;
            % Caso contrario, o valor 0 eh atribuido ao tal pixel 
            else 
                imagem_binarizada{num-2}(lin, col) = 0;
            end % if %
        end % for %
    end % for %
            
    % Concatenando e mostrando a imagem original, e a imagem obtida 
    imagens{num-2} = [imagem{num-2}, imagem_pele];
    imshow(imagens{num-2});
    pause;
    
end % for %

% Retornando ao diretorio inicial 
cd(diretorio_inicial);