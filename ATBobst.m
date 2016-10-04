function ATBobst(coor)
    
    distance = zeros(1,10);                                                             %creo l'array che conterrà la distanza che il robot deve percorrere
    angolo = zeros(1,10);                                                               %creo l'array che conterrà l'angolo di svolta del robot
    mode = zeros(1,5);                                                                  %creo l'array che conterrà il senso di svolta del robot
    
    simulation = zeros(50,50);                                                          %creo la matrice che conterra la simulazione del tutto
    
    for i=1:1:50
        simulation(1,i) = 128;
        for n=1:1:50
            simulation(i,n) = 128;
        end
    end
    
    marginLeftX = coor(1,1)*1;                                                          %trovo la distanza del punto sinistro sull'asse delle x
    marginLeftY = coor(2,1)*1;                                                          %trovo la distanza del punto sinistro sull'asse delle y
    marginRightX = coor(1,3)*1;                                                         %trovo la distanza del punto destro sull'asse delle x
    marginRightY = coor(2,3)*1;                                                         %trovo la distanza del punto destro sull'asse delle y
    
    pixel = 5;                                                                          %rapporo lunghezza pixel
    
    l1 = abs(marginLeftX)*pixel;                                                        %trasformo le coordinate in pixel del margine sinistro sull'asse delle x
    l2 = abs(marginLeftY)*pixel;                                                        %trasformo le coordinate in pixel del margine sinistro sull'asse delle y
    r1 = abs(marginRightX)*pixel;                                                       %trasformo le coordinate in pixel del margine destro sull'asse delle x
    r2 = abs(marginRightY)*pixel;                                                       %trasformo le coordinate in pixel del margine destro sull'asse delle y
    
    %%%CREAZIONE GUI%%%
    figure1 = figure('Color',[1 0.3 0.4],'MenuBar','none','Name','Simulazione','Resize','on','NumberTitle','off');
    btn1 = uicontrol('Style', 'pushbutton', 'String', {'ESCI'},'Position',[460 20 80 40],'Callback', @ATBclose);
    subplot(1,2,1);
    %%%CREAZIONE GUI%%%
    
    simulation(int64(l2),int64(l1)) = 0;                                                %abbino i margini dell'oggetto alla matrice della simulazione
    simulation(int64(r2),int64(r1)) = 0;
    
    if (abs(marginLeftX) < abs(marginRightX))                                           %scelgo se il robot deve girare a destra o sinistra vedendo quale punto è più corto
        
        ipotenusa = sqrt(((marginLeftX + 5)^2) + ((marginLeftY + 5)^2));                %trovo la distanza che deve percorrere il robot
        alpha = acos(ipotenusa/marginLeftY);                                            %trovo l'angolo di svolta del robot
        
        simulationSvolta = sqrt(((marginRightX)^2) + (marginRightY)^2);                 %trovo la distanza che deve percorrere il robot nell simulazione
        
        s2 = l2 + 10;                                                                   %trovo le coordinate del punto sul robot
        s1 = l1 + 1;                                                                    
        
        simulation(s2,s1) = 0;                                                          %abbino le coordinate alla matrice della simulazione
                                  
        %%%PRIMO MOVIMENTO%%%
        distance(1) = ipotenusa;                                                        %distanza che il robot deve percorrere
        angolo(1) = alpha;                                                              %angolo di svolta del robot
        mode(1) = 2;                                                                    %modo in cui deve girare il robot
        ATBmove(mode, angolo, distance);                                                %restituisco alla funzione di movimento gli array
        %%%PRIMO MOVIMENTO%%%
    
        for c=1:1:simulationSvolta                                                      %tutto questo per quanto riguarda la simulazione
            cam1=s1-c;                                                                  
            cam2=s2-c;
            simulation(cam2,cam1) = 0;
            subimage(simulation);
            pause(0.3);
        end
    
        %%%SECONDO MOVIMENTO%%% 
        distance(1) = 15;                                                               %distanza indicativa
        angolo(1) = alpha;                                                              %angolo di svolta del robot       
        mode(1) = 1;                                                                    %modo in cui deve girare il robot
        ATBmove(mode, angolo, distance);                                                %restituisco alla funzione di movimento gli array
        %%%SECONDO MOVIMENTO%%%
    
        for d=1:1:15                                                                    %tutto questo per quanto riguarda la simulazione
            cam3=cam2-d;
            simulation(cam3,cam1) = 0;
            subimage(simulation);
            pause(0.3);
        end
    
        %%%TERZO MOVIMENTO%%%
        distance(1) = ipotenusa;                                                        %distanza che il robot deve percorrere
        angolo(1) = alpha;                                                              %angolo di svolta del robot
        mode(1) = 1;                                                                    %modo in cui deve girare il robot
        ATBmove(mode, angolo, distance);                                                %restituisco alla funzione di movimento gli array
        %%%TERZO MOVIMENTO%%%
       
        for e=1:1:simulationSvolta                                                      %tutto questo per quanto riguarda la simulazione
            simulation(cam3 - e,cam1 + e) = 0;
            subimage(simulation);
            pause(0.3);
        end
        
    else
    
        ipotenusa = sqrt(((marginRightX + 5)^2) + (marginRightY + 5)^2);  
        alpha = acos(ipotenusa/marginRightY);                           
        
        simulationSvolta = sqrt(((marginRightX)^2) + (marginRightY)^2);
        
        s1 = r1 + 5;
        s2 = r2 + 10;
        
        simulation(s2,s1) = 0;
        
        %%%PRIMO MOVIMENTO%%%
        distance(1) = ipotenusa;
        angolo(1) = alpha;
        mode(1) = 1;
        ATBmove(mode, angolo, distance);
        %%%PRIMO MOVIMENTO%%%
        
        for c=1:1:simulationSvolta
            cam1=s1+c;
            cam2=s2-c;
            simulation(cam2,cam1) = 0;
            subimage(simulation);
            pause(0.3);
        end
    
        %%%SECONDO MOVIMENTO%%%
        distance(1) = 15; 
        angolo(1) = alpha;
        mode(1) = 2;
        ATBmove(mode, angolo, distance);    
        %%%SECONDO MOVIMENTO%%%
        
        for d=1:1:15
            cam3=cam2-d;
            simulation(cam3,cam1) = 0;
            subimage(simulation);
            pause(0.3);
        end
    
        %%%TERZO MOVIMENTO%%%
        distance(1) = ipotenusa;
        angolo(1) = alpha;
        mode(1) = 2;
        ATBmove(mode, angolo, distance);     
        %%%TERZO MOVIMENTO%%%
        
        for e=1:1:simulationSvolta
            simulation(cam3 - e,cam1 - e) = 0;
            subimage(simulation);
            pause(0.3);
        end

    end
end