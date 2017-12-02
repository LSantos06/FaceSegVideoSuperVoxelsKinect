% Trabalho 1 - Detector de pele 
% Introducao ao processamento de imagens 2015/2 
% Lucas Nascimento Santos Souza 14/0151010 %

% Modulo de escolha da paleta de cores %

% Obtendo o diretorio atual %
diretorio_inicial = pwd;

% Lendo a paleta escolhida %
paleta_base = imread('paleta.jpg');
% Passando a paleta de rgb para ycbcr %
paleta_base = rgb2ycbcr(paleta_base);

% Calculando o desvio padrao do cb e do cr da paleta de cores %
desvio_padrao_paleta_cb = std2(paleta_base(:, :, 2));
desvio_padrao_paleta_cr = std2(paleta_base(:, :, 3));

% Obtendo o intervalo de aceitacao de cor de pele do cb e do cr %
intervalo_pele_maximo_cb = mean2(paleta_base(:, :, 2)) + desvio_padrao_paleta_cb;
intervalo_pele_minimo_cb = mean2(paleta_base(:, :, 2)) - desvio_padrao_paleta_cb;

intervalo_pele_maximo_cr = mean2(paleta_base(:, :, 3)) + desvio_padrao_paleta_cr;
intervalo_pele_minimo_cr = mean2(paleta_base(:, :, 3)) - desvio_padrao_paleta_cr;

% Retornando ao diretorio inicial %
cd(diretorio_inicial);
