pkg load image;

function [imagem] = imagemMedia(imagemOriginal, n)
  %Cria uma uma matriz com o tamanho da imagem e retorna
  imagem = zeros(256, 384, "double");
  %Aplicar o ruido com media zero e variancia 64 n vezes
  for i = 1:n
    imagemRuido = imnoise (imagemOriginal, "gaussian", 0, 0.25);
    imagem = imagem + imagemRuido;
  endfor
  %Aplica a media de acordo com o valor de n
  for i = 1:256
    for j = 1:384
      imagem(i, j) = imagem(i, j) / n;
    endfor
  endfor
endfunction

%Carregando a imagem e transforma em uma matriz de double
imagem = imread("pratica5.png");
imagem = im2double(imagem);

%Chama a funcao, passando quantas vezes ira aplica o ruido e depois salva as imagens
imwrite(imagemMedia(imagem, 8), "imagem8.png");
imwrite(imagemMedia(imagem, 16), "imagem16.png");
imwrite(imagemMedia(imagem, 64), "imagem64.png");

%Resposta questao 2
%Com os valores de n, que eh a imagem media, vimos quando mais aumentavamos o n
%mais se reduzia os ruidos da imagem.