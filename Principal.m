% Trabalho 1 - Detector de pele 
% Introducao ao processamento de imagens 2015/2 
% Lucas Nascimento Santos Souza 14/0151010 %

% Modulo principal %

tic();

% Limpando o ambiente de trabalho %
clear all;
close all;

% Uso da palheta esolhida %
Paleta;

% Calibrando a cor de pele %
Calibragem;

% Classificando as imagens de acordo com suas categorias %
Classificacao;

Fmeasure;

tempo_total = toc();