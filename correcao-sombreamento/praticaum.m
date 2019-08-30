pkg load image;

filamento = imread("tungsten_filament_shaded.tif");
sensor = imread("tungsten_sensor_shading.tif");

filamento = im2double(filamento);
sensor = im2double(sensor);

novaimagem = filamento./sensor;

imshow(novaimagem);
