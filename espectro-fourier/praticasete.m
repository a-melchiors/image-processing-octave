%Carregando pacote image
pkg load image;

%Carregando a imagem de entrada
imagem = imread("pratica7.png");

%Convertendo a imagem para double
imagem = im2double(imagem);

%Fazendo o padding da imagem
%P = 2 * M
%Q = 2 * N
%M, N dimensao da imagem
M = 808;
N = 754;
P = 2 * M; 
Q = 2 * N;
imagem = fft2(imagem, P, Q);

%Centralizando a transformada de Fourier
transformadaFourier = fftshift(imagem);

%Mostrando o espectro de Fourier
espectroFourier = abs(transformadaFourier);
espectroFourier = uint8(espectroFourier);

filtroNotch  = ones(P, Q, 'double');
%Faz a linha preta no meio
filtroNotch(1:M - 5, N - 5:N + 5) = 0;
filtroNotch(M + 5:P, N - 5:N + 5) = 0;
imwrite(filtroNotch , 'filtro.png');

%Multiplicando a matriz de transformada de Fourier pelo Notch
matrixNotch = transformadaFourier .* filtroNotch;

%Descentralizando a matriz resutado
matrixNotch = ifftshift(matrixNotch);

%Aplicando a transformada inversa rapida
matrixNotch = ifft2(matrixNotch);

%Selecionando a parte real da matriz
matrixNotch = real(matrixNotch);

%Extraindo da regiao M N
matrixNotch = matrixNotch(1: 808, 1: 754);

%Convertendo a imagem para o resultado final
matrixNotch = im2uint8(matrixNotch);

%Imagem final
imwrite(matrixNotch, 'resultado.png');
