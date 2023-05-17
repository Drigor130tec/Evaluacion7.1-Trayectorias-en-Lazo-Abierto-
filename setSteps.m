function [v, w] = setSteps(coord_x, coord_y)
    % Inicializar las variables de posición y ángulo
    px = 0; % coordenada x previa
    py = 0; % coordenada y previa
    th = 0; % ángulo previo

    % Inicializar los vectores de velocidades
    v = []; % velocidad lineal
    w = []; % velocidad angular

    % Iterar a través de los puntos en la trayectoria
    for pts = 1:length(coord_x)
        x = coord_x(pts);
        y = coord_y(pts);
        
        xx = x-px;
        yy = y-py;

        px = x;
        py = y;
        
        % Calcular la dirección del siguiente segmento de la trayectoria
        buffer = atan2(yy, xx);
        % ángulo entre el segmento y la dirección actual
        real_th = buffer - th; 
        th = buffer;

        % Agregar las velocidades lineal y angular necesarias para girar hacia el siguiente segmento
        w = [w, real_th * ones(1, 10)];
        v = [v,       0 * ones(1, 10)];
        
        % Agregar las velocidades lineal y angular necesarias para avanzar en el siguiente segmento
        ds = sqrt(xx^2 + yy^2);
        w = [w,  0 * ones(1, 10)];
        v = [v, ds * ones(1, 10)];
        
    end
    % Agregar una velocidad lineal y angular final de cero para detener el robot
    w = [w, 0*ones(1, 10)];
    v = [v, 0*ones(1, 10)];
end