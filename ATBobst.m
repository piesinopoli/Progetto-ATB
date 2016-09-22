function ATBobst()
    
    global coor
    
    distanza = zeros(1,10);                                                 %creo l'array che conterrà la distanza che il robot deve percorrere
    angoli = zeros(1,10);                                                   %creo l'array che conterrà l'angolo di svolta del robot
    svolta = zeros(1,5);                                                    %creo l'array che conterrà il senso di svolta del robot

    marginLeftX = coor(1,1)*1;                                              %trovo la distanza del punto sinistro sull'asse delle x
    marginRightX = coor(1,3)*1;                                             %trovo la distanza del punto destro sull'asse delle x

    marginLeftY = coor(2,1)*1;                                              %trovo la distanza del punto sinistro sull'asse delle y
    marginRightY = coor(2,3)*1;                                             %trovo la distanza del punto destro sull'asse delle y


    if (abs(marginLeftX) < abs(marginRightX))                               %scelgo se il robot deve girare a destra o sinistra vedendo quale punto è più corto
    
        ipotenusa = sqrt((marginLeftX^2) + (marginLeftY^2));                %trovo la distanza che deve percorrere
        alpha = acos(ipotenusa/marginLeftY);                                %trovo l'angolo di svolta
    
        %%%PRIMO MOVIMENTO%%%
        distanza(1) = ipotenusa;
    
        angoli(1) = alpha;
    
        svolta(1) = 2;
    
        ATBmove(distanza, angoli, svolta);
        %%%PRIMO MOVIMENTO%%%
    
    
    
        %%%SECONDO MOVIMENTO%%%
        distanza(1) = 15;                                                   %distanza indicativa
    
        angoli(1) = alpha;
    
        svolta(1) = 1;
    
        ATBmove(distanza, angoli, svolta);
        %%%SECONDO MOVIMENTO%%%
    
    
    
        %%%TERZO MOVIMENTO%%%
        distanza(1) = ipotenusa;
    
        angoli(1) = alpha;
    
        svolta(1) = 1;
    
        ATBmove(distanza, angoli, svolta);
        %%%TERZO MOVIMENTO%%%
    
    else
    
        ipotenusa = sqrt((marginRightX^2) + (marginRightY^2));              %trovo la distanza che deve percorrere
        alpha = acos(ipotenusa/marginRightY);                               %trovo l'angolo di svolta
    
        %%%PRIMO MOVIMENTO%%%
        distanza(1) = ipotenusa;
    
        angoli(1) = alpha;
    
        svolta(1) = 1;
    
        ATBmove(distanza, angoli, svolta);
        %%%PRIMO MOVIMENTO%%%
    
    
    
        %%%SECONDO MOVIMENTO%%%
        distanza(1) = 15;                                                   %distanza indicativa
    
        angoli(1) = alpha;
    
        svolta(1) = 2;
    
        ATBmove(distanza, angoli, svolta);
        %%%SECONDO MOVIMENTO%%%
    
    
    
        %%%TERZO MOVIMENTO%%%
        distanza(1) = ipotenusa;
    
        angoli(1) = alpha;
    
        svolta(1) = 2;
    
        ATBmove(distanza, angoli, svolta);
        %%%TERZO MOVIMENTO%%%

    end
    
end