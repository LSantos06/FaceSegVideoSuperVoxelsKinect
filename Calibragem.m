% Trabalho 1 - Detector de pele 
% Introducao ao processamento de imagens 2015/2 
% Lucas Nascimento Santos Souza 14/0151010 %

% Modulo de calibragem %

% Obtendo o diretorio das imagens a serem utilizadas %
% Windows
cd('Base de Dados\Calibragem do Sistema\Treinamento Elementos Conectados\Classe 1');
% Linux
%cd('Base de Dados/Calibragem do Sistema/Treinamento Elementos Conectados/Classe 1');

Binarizacao
Rotulacao;
media_nude = mean(area_maior_elemento);

% Obtendo o diretorio das imagens a serem utilizadas %
% Windows
cd('Base de Dados\Calibragem do Sistema\Treinamento Elementos Conectados\Classe 2');
% Linux
%cd('Base de Dados/Calibragem do Sistema/Treinamento Elementos Conectados/Classe 2');

Binarizacao
Rotulacao;
media_nao_nude = mean(area_maior_elemento);

% Retornando ao diretorio inicial %
cd(diretorio_inicial);