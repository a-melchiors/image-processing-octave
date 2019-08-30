pkg load image;

%Carregando imagem
pollen = imread("pollen.jpg");

%Criando matriz de zeros
matrix = zeros (889, 889, "uint8");
vetor = zeros(1, 256, "uint8");

%Definindo as posiçoes do ponto
r1 = double(0);
s1 = double(0);
r2 = double(90);
s2 = double(50);

%Utilizar a equaçao de reta
for x = r1:r2
  m = (s2 - s1) / (r2 - r1);
  y = s1 + m * (x - r1);
  vetor(1, x+1) = y;
endfor

r1 = double(90);
s1 = double(50);
r2 = double(130);
s2 = double(190);

for x = r1:r2
  m = (s2 - s1) / (r2 - r1);
  y = s1 + m * (x - r1);
  vetor(1, x+1) = y;
endfor

r1 = double(130);
s1 = double(190);
r2 = double(255);
s2 = double(255);

for x = r1:r2
  m = (s2 - s1) / (r2 - r1);
  y = s1 + m * (x - r1);
  vetor(1, x+1) = y;
endfor

%Função de transformação de intensidade
plot(0:255, vetor)

%Imagem de saida obtida a partir da aplicacao da funcao T(r) sobre a imagem de entrada
for i = 1:889
  for j = 1:889
    %Eh +1 porque pode aparecer pixel entre 0 e 255
    %entao no nosso vetor agente tem valores de 1 a 256, e nao tem 0 e 255
    matrix(i, j) = vetor(pollen(i, j) + 1);
  endfor
endfor

%Salvando a imagem
%figure, imshow(pollen);
%figure, imshow(matrix);
imwrite(matrix, "final.jpg");

% O melhor valor que foi escolhido foi r1 sendo 90 s1 sendo 50, e r2 sendo 130
%e s2 sendo 190. Esses valores foram escolhidos com base no histograma da imagem
%original que possui pixels em tons de cinza (0 e 255). Mas desse intervalo ele possui 
%pixels nos valores aproximadamente entre 90 e 130. Alem disso, testamos com valores
%diferentes que estavam dentro e fora desse intervalo de pixels disponives, e fora mas os
%os resultados nao foram tao bons ou piores dos valores que citamos anteriormente.
%Obs: Professora, eu testei em outro computador o mesmo codigo e na hora da funcao
%imwrite aparantemente salvou a imagem correta, e eu nao consegui escrever os comentarios com acento.