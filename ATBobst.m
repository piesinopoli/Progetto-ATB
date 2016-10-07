function ATBobst(coor)

    distance = zeros(1,10);                                                             %creo l'array che conterrà la distanza che il robot deve percorrere
    angolo = zeros(1,10);                                                               %creo l'array che conterrà l'angolo di svolta del robot
    mode = zeros(1,5);                                                                  %creo l'array che conterrà il senso di svolta del robot
    
    simulation = zeros(100,100);                                                        %creo la matrice che conterra la simulazione del tutto
    
    for i=1:1:100
        simulation(1,i) = 128;
        for n=1:1:100
            simulation(i,n) = 128;
        end
    end
    
    rapportoPixel = 2;                                                                          
    rapportoCentimetri = 1;
    
    marginLeftX = abs(coor(1,1));
    marginLeftY = abs(coor(2,1));
    marginRightX = abs(coor(1,3));
    marginRightY = abs(coor(2,3));
    
    realMarginLeftX = coor(1,1)*rapportoCentimetri;
    realMarginLeftY = coor(2,1)*rapportoCentimetri;
    realMarginRightX = coor(1,3)*rapportoCentimetri;
    realMarginRightY = coor(2,3)*rapportoCentimetri;
    
    simulationDistanza = (abs(coor(1,3)-coor(1,1)))*rapportoPixel;
    
    simulationMarginLeftX = int64(50-(simulationDistanza/2));
    simulationMarginLeftY = 50;
    simulationMarginRightX = 100-(100-simulationDistanza-simulationMarginLeftX);
    simulationMarginRightY = 50;
 
    %%%CREAZIONE GUI%%%
    figure1 = figure('Color',[1 0.3 0.4],'MenuBar','none','Name','Simulazione','Resize','on','NumberTitle','off');
    btn1 = uicontrol('Style', 'pushbutton', 'String', {'ESCI'},'Position',[460 20 80 40],'Callback', @ATBclose);
    subplot(1,2,1);
    %%%CREAZIONE GUI%%%
    
    simulation(simulationMarginLeftY,simulationMarginLeftX) = 0;                                                        
    simulation(simulationMarginRightY,simulationMarginRightX) = 0;

    if (abs(marginLeftX) < abs(marginRightX))                                                                            
                   
        realIpotenusa = sqrt(((realMarginLeftX)^2)+((realMarginLeftY)^2));                                                  
        simulationIpotenusa = (sqrt(((realMarginLeftX)^2)+((realMarginLeftY)^2)))*rapportoPixel
        
        alpha = 90-((acos(realIpotenusa/realMarginLeftY))+10);
        
        if (coor(1,1) < 0)
            
            s1=(simulationMarginLeftX)+(marginLeftX*rapportoPixel);
            s2=(simulationMarginLeftY)+(marginLeftY*rapportoPixel);
            
            simulation(s2,s1) = 0;
            
            %%%PRIMO MOVIMENTO%%%
            distance(1) = realIpotenusa;                                                       
            angolo(1) = alpha;                                                              
            mode(1) = 2;                                                                   
            ATBmove(mode, angolo, distance);                                                
            %%%PRIMO MOVIMENTO%%%
    
            for c=1:1:simulationIpotenusa                                                      
                cam1=s1-c;                                                                  
                cam2=s2-c;
                simulation(cam2,cam1) = 0;
                subimage(simulation);
                pause(0.3);
            end
    
            %%%SECONDO MOVIMENTO%%% 
            distance(1) = 15;                                                               
            angolo(1) = alpha;                                                                     
            mode(1) = 1;                                                                    
            ATBmove(mode, angolo, distance);                                                
            %%%SECONDO MOVIMENTO%%%
    
            for d=1:1:15                                                                    
                cam3=cam2-d;
                simulation(cam3,cam1) = 0;
                subimage(simulation);
                pause(0.3);
            end
    
            %%%TERZO MOVIMENTO%%%
            distance(1) = realIpotenusa;                                                        
            angolo(1) = alpha;                                                              
            mode(1) = 1;                                                                    
            ATBmove(mode, angolo, distance);                                                
            %%%TERZO MOVIMENTO%%%
       
            for e=1:1:simulationIpotenusa                                                      
                simulation(cam3 - e,cam1 + e) = 0;
                subimage(simulation);
                pause(0.3);
            end
            
        else
                
            s1=(simulationMarginLeftX)-(marginLeftX*rapportoPixel);
            s2=(simulationMarginLeftY)+(marginLeftY*rapportoPixel);
            
            simulation(s2,s1) = 0;
            
            %%%PRIMO MOVIMENTO%%%
            distance(1) = realIpotenusa;                                                        
            angolo(1) = alpha;                                                              
            mode(1) = 2;                                                                    
            ATBmove(mode, angolo, distance);                                                
            %%%PRIMO MOVIMENTO%%%
    
            for c=1:1:simulationIpotenusa                                                     
                cam1=s1-c;                                                                  
                cam2=s2-c;
                simulation(cam2,cam1) = 0;
                subimage(simulation);
                pause(0.3);
            end
    
            %%%SECONDO MOVIMENTO%%% 
            distance(1) = 15;                                                               
            angolo(1) = alpha;                                                                    
            mode(1) = 1;                                                                    
            ATBmove(mode, angolo, distance);                                                
            %%%SECONDO MOVIMENTO%%%
    
            for d=1:1:15                                                                    
                cam3=cam2-d;
                simulation(cam3,cam1) = 0;
                subimage(simulation);
                pause(0.3);
            end
    
            %%%TERZO MOVIMENTO%%%
            distance(1) = realIpotenusa;                                                        
            angolo(1) = alpha;                                                              
            mode(1) = 1;                                                                   
            ATBmove(mode, angolo, distance);                                                
            %%%TERZO MOVIMENTO%%%
       
            for e=1:1:simulationIpotenusa                                                     
                simulation(cam3 - e,cam1 + e) = 0;
                subimage(simulation);
                pause(0.3);
            end            
            
        end 
        
    else
    
        realIpotenusa = sqrt(((realMarginRightX)^2)+((realMarginRightY)^2));                
        simulationIpotenusa = (sqrt(((realMarginRightX)^2)+((realMarginRightY)^2)))*rapportoPixel
        
        alpha = (acos(realIpotenusa/realMarginRightY))+10;
        
        if (coor(1,3) < 0)
            
            s1=(simulationMarginRightX)+(marginRightX*rapportoPixel);
            s2=(simulationMarginRightY)+(marginRightY*rapportoPixel);
            
            simulation(s2,s1) = 0;
            
            %%%PRIMO MOVIMENTO%%%
            distance(1) = realIpotenusa;
            angolo(1) = alpha;
            mode(1) = 1;
            ATBmove(mode, angolo, distance);
            %%%PRIMO MOVIMENTO%%%
        
            for c=1:1:simulationIpotenusa
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
            distance(1) = realIpotenusa;
            angolo(1) = alpha;
            mode(1) = 2;
            ATBmove(mode, angolo, distance);     
            %%%TERZO MOVIMENTO%%%
        
            for e=1:1:simulationIpotenusa
                simulation(cam3 - e,cam1 - e) = 0;
                subimage(simulation);
                pause(0.3);
            end
            
        else
            
            s1=(simulationMarginRightX)-(marginRightX*rapportoPixel);
            s2=(simulationMarginRightY)+(marginRightY*rapportoPixel);
            
            simulation(s2,s1) = 0;
            
            %%%PRIMO MOVIMENTO%%%
            distance(1) = realIpotenusa;
            angolo(1) = alpha;
            mode(1) = 1;
            ATBmove(mode, angolo, distance);
            %%%PRIMO MOVIMENTO%%%
        
            for c=1:1:simulationIpotenusa
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
            distance(1) = realIpotenusa;
            angolo(1) = alpha;
            mode(1) = 2;
            ATBmove(mode, angolo, distance);     
            %%%TERZO MOVIMENTO%%%
        
            for e=1:1:simulationIpotenusa
                simulation(cam3 - e,cam1 - e) = 0;
                subimage(simulation);
                pause(0.3);
            end
            
        end

    end
end