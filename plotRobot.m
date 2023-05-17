function plotRobot(N, x, y, phi, hx, hy, xmn, xmx, ymn, ymx)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%% SIMULACION VIRTUAL 3D %%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    % a) Configuracion de escena
    ts = 0.001;
    scene=figure;  % Crear figura (Escena)
    set(scene,'Color','white'); % Color del fondo de la escena
    set(gca,'FontWeight','bold') ;% Negrilla en los ejes y etiquetas
    sizeScreen=get(0,'ScreenSize'); % Retorna el tamaño de la pantalla del computador
    set(scene,'position',sizeScreen); % Configurar tamaño de la figura
    camlight('headlight'); % Luz para la escena
    axis equal; % Establece la relación de aspecto para que las unidades de datos sean las mismas en todas las direcciones.
    grid on; % Mostrar líneas de cuadrícula en los ejes
    box on; % Mostrar contorno de ejes
    xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)'); % Etiqueta de los eje
    
    view([-0.1 35]); % Orientacion de la figura
    axis([xmn xmx ymn ymx 0 1]); % Ingresar limites minimos y maximos en los ejes x y z [minX maxX minY maxY minZ maxZ]
    
    scale = 2;
    MobileRobot;
    H1=MobilePlot(x(1),y(1),phi(1),scale);hold on;
    H2=plot3(hx(1),hy(1),0,'r','lineWidth',2);
    
    for k=1:N
    
        delete(H1);    
        delete(H2);
        
        H1=MobilePlot(x(k),y(k),phi(k),scale);
        H2=plot3(hx(1:k),hy(1:k),zeros(1,k),'r','lineWidth',2);
        
        %pause(ts);
    
    end
end