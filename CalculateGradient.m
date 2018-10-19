function grad = CalculateGradient(position, arena)
  
  grad = [0 0];
  %beeTemperature = GetTemperature(position,arena);
    
  for i = 1 : length(arena.casu)
    deltaX = arena.casu(i).position.x - position.x;
    deltaY = arena.casu(i).position.y - position.y;
    sigmaX = arena.casu(i).sigma.x;
    sigmaY = arena.casu(i).sigma.y;
    gradTmp = (arena.casu(i).temperature - arena.surroundTemp) * ...
      exp(- deltaX^2 / (2 * sigmaX) - deltaY^2 / (2 * sigmaY));
    grad(1) = grad(1) + gradTmp * deltaX / sigmaX;
    grad(2) = grad(2) + gradTmp * deltaY / sigmaY;
  end
end
