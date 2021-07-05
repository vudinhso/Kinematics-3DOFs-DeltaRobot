function [c, r] = fcn_circum(p1,p2,p3)
    
    #{
    delt =  (2*norm(cross(p1-p2, p2-p3))^2);
    r =     (norm(p1-p2)*norm(p2-p3)*norm(p3-p1))/...
            (2*norm(cross(p1-p2, p2-p3)));
    alph =  (norm(p2-p3)^2 * dot(p1-p2, p1-p3))/delt;
    beta =  (norm(p1-p3)^2 * dot(p2-p1, p2-p3))/delt;
    gama =  (norm(p1-p2)^2 * dot(p3-p1, p3-p2))/delt;
    c = alph*p1 + beta*p2 + gama*p3;
    #}
    delt =  norm(cross(p1-p2, p2-p3));
    r =     (norm(p1-p2)*norm(p2-p3)*norm(p3-p1))/...
            (2*delt);
    alph =  (norm(p2-p3)^2 * dot(p1-p2, p1-p3))/(2*delt^2);
    beta =  (norm(p1-p3)^2 * dot(p2-p1, p2-p3))/(2*delt^2);
    gama =  (norm(p1-p2)^2 * dot(p3-p1, p3-p2))/(2*delt^2);
    c = alph*p1 + beta*p2 + gama*p3;
endfunction
