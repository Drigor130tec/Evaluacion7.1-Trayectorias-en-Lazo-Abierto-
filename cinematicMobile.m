function [N, x, y, phi, hx, hy] = cinematicMobile(v, w)
    %%%%%%%%%%%%%%%%%%%%%%%%% TIEMPO %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    tf = length(v)/10;   % Tiempo de simulación en segundos (s)
    ts = 0.1;                % Tiempo de muestreo en segundos (s)
    t = 0:ts:tf;             % Vector de tiempo
    N = length(t)-1;           % Muestras

    %%%%%%%%%%%%%%%%%%% CONDICIONES INICIALES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Inicializamos las variables que se van a emplear
    x = zeros (1, N+1);       % Posición (X) en el centro del eje que une las ruedas en metros (m)
    y = zeros (1, N+1);       % Posición (Y) en el centro del eje que une las ruedas en metros (m)
    phi = zeros (1, N+1);      % Orientación del robot en radiaanes (rad)
    
    %Damos valores a nuestro punto inicial de posición y orientación
    x(1)=0;    %Posición inicial eje x
    y(1)=0;    %Posición inicial eje y
    phi(1)=0;   %Orientación inicial del robot 
    
    %%%%%%%%%%%%%%%%%%%%% PUNTO DE CONTROL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Inicializamos el punto de control 
    hx= zeros (1, N+1);       % Posición en el eje (X) del punto de control en metros (m)
    hy= zeros (1, N+1);       % Posición en el eje (Y) del punto de control en metros (m)
    
    %Igualamos el punto de control con las proyecciones X1 y Y1 por su
    %coincidencia
    hx(1) = x(1);       % Posición del punto de control en el eje (X) metros (m)
    hy(1) = y(1);       % Posición del punto de control en el eje (Y) metros (m)

    for k = 1:N 
    
        %Aplico la integral a la velocidad angular para obtener el angulo "phi" de la orientación
        phi(k+1) = phi(k) + w(k) * ts; % Integral numérica (método de Euler)
               
       %%%%%%%%%%%%%%%%%%%%% MODELO CINEMATICO %%%%%%%%%%%%%%%%%%%%%%%%%
        
        xp=v(k) * cos(phi(k)); % Posición en x 
        yp=v(k) * sin(phi(k)); % Posición en y
     
        %Aplico la integral a la velocidad lineal para obtener las cordenadas
        %"x1" y "y1" de la posición
        x(k+1) = x(k) + ts * xp; % Integral numérica (método de Euler)
        y(k+1) = y(k) + ts * yp; % Integral numérica (método de Euler)
    
        % Posicion del robot con respecto al punto de control
        hx(k+1) = x(k+1); 
        hy(k+1) = y(k+1);
     end
end
