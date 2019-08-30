pkg load image;

%Carregando imagem
einstein = imread("imagem.jpg");
vetorN = zeros(1, 256, "double"); %vetor com os valores do hisograma e depois normalizado
vetorS = zeros(1, 256, "double"); %vetor com os resultado da transformacao de equalizacao
final = zeros (679, 800, "uint8"); %vetor com valores do pixel da imagem final
M = 800;
N = 679;

%Carregando valores do histograma
[vetorN, x] = imhist(einstein);

%Normalizando os valores
for i = 1:256
  vetorN(i) = vetorN(i) / (M * N);
endfor

%Transformação de equalizaçao de hisotgrama
for i = 1:256
  for j = 1:i
    vetorS(i) = vetorS(i) + (255 * vetorN(j));
  endfor
endfor

%Arredondando valores
round(vetorS);

%Plotando o grafico
plot(1:256, vetorS);
axis([1 256 1 256]);

%Imagem de saida obtida a partir da aplicacao da funcao T(r) sobre a imagem de entrada
for i = 1:679
  for j = 1:800
    %Eh +1 porque pode aparecer pixel entre 0 e 255
    %entao no nosso vetor agente tem valores de 1 a 256, e nao tem 0 e 255
    final(i, j) = vetorS(einstein(i, j) + 1);
  endfor
endfor

%Salvando a imagem
imwrite(final, "final.jpg");
