function bees = InitializeBees(nBees, arena)
  global alphas pBetaIs1 kws

  nTypes = length(nBees);
  for iType = 1 : nTypes
    for i = 1 : nBees(iType)
      iBee = i + sum(nBees(1:iType - 1));
      bees(iBee).phi = rand() * 2 * pi;
      radius = rand() * arena.radius;
      bees(iBee).position.x = radius * cos(bees(iBee).phi);
      bees(iBee).position.y = radius * sin(bees(iBee).phi);
      bees(iBee).alpha = alphas(iType);
      bees(iBee).beta = pBetaIs1(iType);
      bees(iBee).s = 0;
      bees(iBee).C = 0.5; %cm
      bees(iBee).kw = kws(iType);
      bees(iBee).W = 0;
    end
  end

end
