pkg load image;

%Carregando a imagem
imagem = imread("pratica5.jpg");

%Convertendo a imagem para double
imagem = im2double(imagem);

%Filtro da media
filtroMedia = zeros(9, 9, "double");

for i = 1:9
  for j = 1:9
    filtroMedia(i, j) = 1/81;
  endfor
endfor

%Usando a funcao filter2
imagemFiltroMedia = filter2(filtroMedia, imagem);

%Resposta da questao cinco
%R: A imagem resultante do passo 4 tem uma borda de zeros, que foi suavizada.

imshow(imagemFiltroMedia);

%Usando a funcao padarray
imagemPadArray = padarray(imagem, [4 4], "replicate");

%Aplicando novamente o filtro da media
imagemPadArray = filter2(filtroMedia, imagemPadArray, 'valid');

imshow(imagemPadArray);

%Montando os valores do filtro de Sobel
filtroSobelH = zeros(3, 3, "int8");
filtroSobelV = zeros(3, 3, "int8");

%Valores do filtro de Sobel horizontal
filtroSobelH(1, 1) = -1;
filtroSobelH(1, 2) = -2;
filtroSobelH(1, 3) = -1;

filtroSobelH(3, 1) = 1;
filtroSobelH(3, 2) = 2;
filtroSobelH(3, 3) = 1;

%Valores do filtro de Sobel vertical
filtroSobelV(1, 1) = -1;
filtroSobelV(2, 1) = -2;
filtroSobelV(3, 1) = -1;

filtroSobelV(1, 3) = 1;
filtroSobelV(2, 3) = 2;
filtroSobelV(3, 3) = 1;

%Replicando o padding
imagemSobel = padarray(imagem, [1 1], "replicate");

imagemSobelX = filter2(filtroSobelH, imagemSobel, 'valid');
imagemSobelY = filter2(filtroSobelV, imagemSobel, 'valid');

%Calculando a magnitude
imagemSobelSaida = abs(imagemSobelX) + abs(imagemSobelY);
imshow(imagemSobelSaida);