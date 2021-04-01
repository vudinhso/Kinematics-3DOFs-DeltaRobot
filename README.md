# DeltaRobot
DeltaRobot kinematics
- IK:             solve and plot the Delta Robot inverse kinematics. 
  The Cartesian position is known. The joint angles are determined trigonometric formula (half-angles). 
- FK_trilat:      solve and plot the Delta Robot forward kinematics with the trilateration technique (intersection of three spheres).
- FK_Plane_Line:  solve and plot the Delta Robot forward kinematics with the paper technique (intersection of a plane and a line).
- FK_CircumCentre_Triangle:  
                  solve and plot the Delta Robot forward kinematics with the determination of the line and a distance.
                  The line equation is perpendicular to the plane of virtual centre, and passes through the circumcentre circle triangle. 
                  The distance along the line is determined by the radius of the circumcentre circle (Pythagore). 
- fcn_circum:     Calculate the centre and the radius of the circumcentre circle triangle (not trivial, from wiki). 
  
