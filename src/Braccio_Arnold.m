startup_rvc

% Create DH parameters for each link
L(1) = Link('revolute', 'd', 100, 'a', 0, 'alpha', -pi/2);
L(1) = Link('revolute', 'd', 71.71, 'a', 0, 'alpha', -pi/2)
L(2) = Link('revolute', 'd', 0, 'a', 125.2, 'alpha', 0)
L(3) = Link('revolute', 'd', 0, 'a', 125.2, 'alpha', 0)
L(4) = Link('revolute', 'd', 0, 'a', 0, 'alpha', -pi/2)
L(5) = Link('revolute', 'd', 160, 'a', 0, 'alpha', 0)
Arnold = SerialLink(L, 'name', 'Arnold') % create serial manipulator

% Define joint forward kinematics
q=[pi/4, 0, 20, pi/6, pi/3, 0]; 
q=[0, -pi/2, 0, -pi/2, 0]

% Create forward kinematics
T6_0=Arnold.fkine(q)
q=[pi, -pi/2, 0, -pi/2, 0]
T6_0=Arnold.fkine(q)

 % Define the workspace for plot
W = [-150, 150, -150, 150, 0, 200];  
W = [-150, 150, -150, 150, 0, 200];

% Plot the manipulator
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', W)
W = [-150, 150, -150, 150, 0, 500];
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', W)
q=[pi, -pi/4, 0, -pi/2, 0]
W = [-500, 500, 500, 500, 0, 500];
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', W)
W = [-500, 500, 500, 500, 0, 500];
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', W)
W = [-500, 500, -500, 500, 0, 500];
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', W)
% Teach the manipulator
Arnold.teach('[no]deg')