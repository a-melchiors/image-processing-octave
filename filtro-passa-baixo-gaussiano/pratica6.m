%Carregando pacote image
pkg load image;

%Carregando a imagem de entrada
imagem = imread("pratica6.png");

%Convertendo a imagem para double
imagem = im2double(imagem);

%Fazendo o padding da imagem
%P = 2 * M
%Q = 2 * N
%M, N dimensao da imagem
%A dimensao da transformada é 512 linhas e 512 colunas.
imagem = fft2(imagem, 512, 512);

%Centralizando a transformada de Fourier
transformadaFourier = fftshift(imagem);

%Mostrando o espectro de Fourier
espectroFourier = abs(transformadaFourier);
espectroFourier = uint8(espectroFourier);

GLPF = zeros(512, 512, "double");

%Construindo o filtro passa-baixa gaussiano de dimensao
%[0, 511] = [1, 512-1]
%u = [0, P-1] v = [0, Q-1], começa em um porque matriz no octave comeca em 1
for u = 0:511
  for v = 0:511
  %Calculando du
  du = (u - (512/2));
  du = (du^2);
  
  %Calcualdno dv
  dv = (v - (512/2));
  dv = (dv^2);
  
  %Calculando duv
  duv = du + dv;
  duv = (duv^0.5);

  %20 valor de D0
  GLPF(u+1,v+1) = e^((-(duv^2)) / (2 * (20^2)));
  
  endfor
endfor

%Multiplicando a matriz de transformada de Fourier pelo GLPF
matrixGLPF = transformadaFourier .* GLPF;

%Descentralizando a matriz resutado
matrixGLPF = ifftshift(matrixGLPF);

%Aplicando a transformada inversa rapida
matrixGLPF = ifft2(matrixGLPF);

%Selecionando a parte real da matriz
matrixGLPF = real(matrixGLPF);

%Extraindo da regiao M N
matrixGLPF = matrixGLPF(1: 256, 1: 256);

%Convertendo a imagem para o resultado final
matrixGLPF = im2uint8(matrixGLPF);

%Imagem final
imshow(matrixGLPF)


