function temp = GetTemperature(position, arena)

  nCasu = length(arena.casu);
  temps = zeros(1, nCasu);
  for i = 1 : nCasu
    deltaX = arena.casu(i).position.x - position.x;
    deltaY = arena.casu(i).position.y - position.y;
    sigmaX = arena.casu(i).sigma.x;
    sigmaY = arena.casu(i).sigma.y;
    temps(i) = (arena.casu(i).temperature - arena.surroundTemp) * ...
      exp(-deltaX^2 / (2 * sigmaX) - deltaY^2 / (2 * sigmaY));
  end
  temp = max(temps);
  temp = temp + arena.surroundTemp;

%   deltaX1 = arena.casu(1).position.x - position.x;
%   deltaY1 = arena.casu(1).position.y - position.y;
%   sigmaX1 = arena.casu(1).sigma.x;
%   sigmaY1 = arena.casu(1).sigma.y;
%   deltaX2 = arena.casu(2).position.x - position.x;
%   deltaY2 = arena.casu(2).position.y - position.y;
%   sigmaX2 = arena.casu(2).sigma.x;
%   sigmaY2 = arena.casu(2).sigma.y;
%   temp = (arena.casu(1).temperature - arena.surroundTemp) * ...
%     exp(- deltaX1^2 / (2 * sigmaX1) - deltaY1^2 / (2 * sigmaY1)) +...
%     (arena.casu(2).temperature - arena.surroundTemp) * ...
%     exp(- deltaX2^2 / (2 * sigmaX2) - deltaY2^2 / (2 * sigmaY2)) ...
%     + arena.surroundTemp; 
end
