L(1) = Link('revolute', 'd', 71.71, 'a', 0, 'alpha', -pi/2);
L(2) = Link('revolute', 'd', 0, 'a', 125.2, 'alpha', 0);
L(3) = Link('revolute', 'd', 0, 'a', 125.2, 'alpha', 0);
L(4) = Link('revolute', 'd', 0, 'a', 0, 'alpha', -pi/2);
L(5) = Link('revolute', 'd', 160, 'a', 0, 'alpha', 0)
% Links for each frame

Arnold = SerialLink(L, 'name', 'Arnold')
% Name of Robot
q = [0, -pi/2, 0, -pi/2, 0]
% Q variable for Position Matrix
T6_0=Arnold,fkine(q)
% Forward Kinematicsfor Q
T6_0 = Arnold.fkine(q)
% T6_0 puts all matrices together
q = [pi, -pi/2, 0, -pi/2, 0]

T6_0 = Arnold.fkine(q)
w = [-150, 150, -150, 150, 0, 200]
%w = Initial area for Arnold robot plot
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', W)
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', w)

w = [-500, 500, -500, 500, 0, 500]
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', w)

q = [pi, -pi/2, 0, -pi/2, 0]
Arnold.plot(q, 'trail',{'r', 'LineWidth', 2}, 'workspace', w)


Arnold.teach('[no]deg')