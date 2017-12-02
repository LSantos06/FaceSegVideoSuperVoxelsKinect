% Trabalho 1 - Detector de pele 
% Introducao ao processamento de imagens 2015/2 
% Lucas Nascimento Santos Souza 14/0151010 %

% Modulo de classificacao %

% Obtendo o diretorio das imagens a serem classificadas como nudes %
% Windows
cd('Base de Dados/Execução e Análise/Categoria 1 - Nude');
% Linux
%cd('Base de Dados/Execução e Análise/Categoria 1 - Nude');

% Obtendo o diretorio atual %
diretorio_nude = dir;

Binarizacao;
Rotulacao;

% Criando as variaveis de avaliacao %
contador_verdadeiro_positivo = 0;
contador_falso_positivo = 0;
resultado_nude(length(diretorio_nude)) = 0;

% Percorrendo o diretorio das imagens %
for num = 3:length(diretorio_nude) 
    % A imagem eh nude, e eh classificada como nude %
    if(area_maior_elemento(num-2) >= media_nude)
        resultado_nude(num-2) = 0;
        contador_verdadeiro_positivo = contador_verdadeiro_positivo + 1;
    elseif(area_maior_elemento(num-2) >= media_nao_nude)
        resultado_nude(num-2) = 0;
        contador_verdadeiro_positivo = contador_verdadeiro_positivo + 1;
    % A imagem eh nude, e eh classificada como nao nude %
    else   
        resultado_nude(num-2) = 1;
        contador_falso_positivo = contador_falso_positivo + 1;
    end
end

% Retornando ao diretorio inicial %
cd(diretorio_inicial);

% Obtendo o diretorio das imagens a serem classificadas como nao nudes %
% Windows
cd('Base de Dados\Execução e Análise\Categoria 2 - Roupa');
% Linux
%cd('Base de Dados/Execução e Análise/Categoria 2 - Roupa');

% Obtendo o diretorio atual %
diretorio_nao_nude = dir;

Binarizacao;
Rotulacao;

% Criando as variaveis de avaliacao %
contador_verdadeiro_negativo = 0;
contador_falso_negativo = 0;
resultado_nao_nude(length(diretorio_nao_nude)) = 0;

% Percorrendo o diretorio das imagens %
for num = 3:length(diretorio_nao_nude) 
    % A imagem eh nao nude, e eh classifcada como nao nude %
    if(area_maior_elemento(num-2) <= media_nao_nude)
        resultado_nao_nude(num-2) = 2;
        contador_verdadeiro_negativo = contador_verdadeiro_negativo + 1;
    elseif(area_maior_elemento(num-2) <= media_nude)
        resultado_nao_nude(num-2) = 2;
        contador_verdadeiro_negativo = contador_verdadeiro_negativo + 1;
    % A imagem eh nao nude, e eh classificada como nude %
    else
        resultado_nao_nude(num-2) = 3;
        contador_falso_negativo = contador_falso_negativo + 1;
    end
end

% Retornando ao diretorio inicial %
cd(diretorio_inicial);