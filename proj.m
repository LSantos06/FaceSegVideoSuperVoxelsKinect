%% Universidade de Brasilia
% Departamento de Ciencia de Computacao
% Principios de Visao Computacional
% 2/2017

% Filipe Teixeira 14/0139486
% Lucas Santos 14/0151010

%% Projeto Final

clear all;
close all;

%% Convertendo arquivo DepthFrame MAT em ASCII PGM 16-bits

% Carregando o arquivo DepthFrame MAT
depth_frame = importdata('input_frames\DepthFrame0102.mat');
% Rotacionando os dados para compatibilidade com o ColorFrame
depth_frame = rot90(fliplr(depth_frame));
figure(), imshow(depth_frame*10);
% Obtendo altura e largura do arquivo DepthFrame MAT
[depth_height, depth_width] = size(depth_frame);
% Criando novo arquivo ASCII PGM 16-bits
fileID = fopen('output_frames\DepthFrame0102.pgm', 'w');
% Cabecalho padrao ASCII PGM 16-bits
fprintf(fileID, 'P2\n');
fprintf(fileID, depth_width + " " + depth_height + "\n");
fprintf(fileID, '65535\n');
% Loop para escrita dos dados em si
for i=1:depth_height
    for j=1:depth_width
        fprintf(fileID, depth_frame(i,j) + " ");
    end
    fprintf(fileID, '\n');
end
% Fechando arquivo ASCII PGM 16-bits
fclose(fileID);

%% Redimensionar e recortar o ColorFrame para compatibilidade com o DepthFrame

% Carregando o arquivo ColorFrame JPG
color_frame = importdata('input_frames\ColorFrame0102.jpg');
% Obtendo altura e largura do arquivo ColorFrame JPG
[color_height, color_width, color_dimension] = size(color_frame);
% Cortando o arquivo ColorFrame JPG 
% Posicionamento da selecao para o corte: [xmin ymin width height]
cropped_color_frame = imcrop(color_frame,[308 0 1304 1080]); %figure(), imshow(cropped_color_frame);
% Redimensionando o arquivo ColorFrame JPG
resized_color_frame = imresize(cropped_color_frame, [depth_height depth_width]);
figure(), imshow(resized_color_frame);
% Criando novo arquivo JPG
imwrite(resized_color_frame,'output_frames\ColorFrame0102.png');

%% Rodar DASP