%% Universidade de Brasilia
% Departamento de Ciencia de Computacao
% Principios de Visao Computacional
% 2/2017

% Filipe Teixeira 14/0139486
% Lucas Santos 14/0151010

%% Projeto Final - Rotulacao

% Obtendo o diretorio atual 
diretorio = dir;

% Criando a variavel contador_equivalencias, que conta o numero de equivalencias da imagem 
contador_equivalencias(length(diretorio)) = 0;

% Criando a variavel matriz_rotulo, que armazena os rotulos 
matriz_rotulo{length(diretorio)} = 0;

% Criacao de um vetor para o armazenamento do numero de elementos conectados que a imagem possui 
elementos_conectados(length(diretorio)) = 0;

% Criacao de um vetor para o armazenamento das areas dos maiores elementos 
area_maior_elemento(length(diretorio)) = 0;

% Criacao de um vetor para o armazenamento dos maiores elementos 
maior_elemento(length(diretorio)) = 0;

% Percorrendo o diretorio das imagens 
for num = 3:length(diretorio) 
    % Obtendo o tamanho da imagem binarizada 
    [linhas, colunas, dimensao] = size(imagem_binarizada{num-2});
    
    % Filtrando a imagem binarizada 
    imagem_binarizada{num-2} = medfilt1(imagem_binarizada{num-2});
    
    % Criando a variavel rotulo, que eh reiniciada para cada imagem percorrida 
    rotulos = 1;
    
    % Inicializando a variavel contador_equivalencias, que conta o numero de equivalencias da imagem 
    contador_equivalencias(num-2) = 1;
    
    % Inicializando a matriz rotulo, adotando as bordas com o valor 2 
    for lin = 1:linhas
        for col = 1:colunas
            matriz_rotulo{num-2}(lin, col) = 2;
        end % for %
    end % for %
    
    % Percorrendo a imagem binarizada 
    for lin = 2:(linhas-1)
        for col = 2:(colunas-1)
            
            % Se o pixel for igual a 1, analisam-se os vizinhos 
            if(imagem_binarizada{num-2}(lin, col) == 1)
                % Se os vizinhos 'baixo' e 'esquerda' sao iguais a 0, um novo rotulo eh adicionado ao
                % pixel corrente %
                if(imagem_binarizada{num-2}(lin-1, col) == 0 && imagem_binarizada{num-2}(lin, col-1) == 0)
                    rotulos = rotulos + 1;
                    matriz_rotulo{num-2}(lin, col) = rotulos;
                
                % Se os vizinhos 'baixo' ou 'esquerda' sao iguais a 1, um rotulo eh adicionado ao
                % pixel corrente 
                elseif(imagem_binarizada{num-2}(lin-1, col) == 0 && imagem_binarizada{num-2}(lin, col-1) == 1)
                    matriz_rotulo{num-2}(lin, col) = rotulos;
                elseif(imagem_binarizada{num-2}(lin-1, col) == 1 && imagem_binarizada{num-2}(lin, col-1) == 0)
                    matriz_rotulo{num-2}(lin, col) = rotulos;
                
                % Se os vizinhos 'baixo' e 'esquerda' sao iguais a 1, e
                % possuem o mesmo rotulo, o pixel recebe este rotulo 
                elseif((imagem_binarizada{num-2}(lin-1, col) == 1 && imagem_binarizada{num-2}(lin, col-1) == 1) && (matriz_rotulo{num-2}(lin-1, col) == matriz_rotulo{num-2}(lin, col-1)));
                    matriz_rotulo{num-2}(lin, col) = matriz_rotulo{num-2}(lin-1, col);
                
                % Se os vizinhos 'baixo' e 'esquerda' sao iguais a 1, e
                % possuem rotulos diferentes, o pixel recebe qualquer um dos rotulos 
                elseif((imagem_binarizada{num-2}(lin-1, col) == 1 && imagem_binarizada{num-2}(lin, col-1) == 1) && (matriz_rotulo{num-2}(lin-1, col) ~= matriz_rotulo{num-2}(lin, col-1)));
                    matriz_rotulo{num-2}(lin, col) = matriz_rotulo{num-2}(lin-1, col);
                    
                    % Contando e atribuindo as equivalencias 
                    equivalencia{contador_equivalencias(num-2)} = [matriz_rotulo{num-2}(lin-1, col), matriz_rotulo{num-2}(lin, col-1)];
                    
                    % Substituindo as equivalencias, de modo que o valor
                    % sempre seja substituido por um equivalente menor 
                    if(matriz_rotulo{num-2}(lin, col-1) >= matriz_rotulo{num-2}(lin-1, col))
                        matriz_rotulo{num-2}(lin, col-1) = matriz_rotulo{num-2}(lin-1, col);
                    elseif(matriz_rotulo{num-2}(lin, col-1) < matriz_rotulo{num-2}(lin-1, col))
                        matriz_rotulo{num-2}(lin-1, col) = matriz_rotulo{num-2}(lin, col-1);
                    end % if %
                    
                    % Contando as equivalencias 
                    contador_equivalencias(num-2) = contador_equivalencias(num-2) + 1;
                end % if %
                
            % Caso contrario, nada eh feito 
            else
                matriz_rotulo{num-2}(lin, col) = 1;
            end % if %
             
        end % for %
    end % for %
    
    % Inicializacao de um vetor para o armazenamento do numero de elementos
    % conectados que a imagem possui, desconsiderando o fundo 
    elementos_conectados(num-2) = (rotulos-1);     
    
    % Checando a organizacao dos rotulos dos elementos conectados 
    %todos_elementos{num} = unique(matriz_rotulo{num}(:));
    
    % Obtendo o maior elemento e sua area %
    [area_maior_elemento(num-2),maior_elemento(num-2)] = max(histc(matriz_rotulo{num-2}(:),2:(rotulos+1)));
    
end % for %

% Retornando ao diretorio inicial %
cd(diretorio_inicial);
