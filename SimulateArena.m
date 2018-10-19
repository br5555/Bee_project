function [bees, arena, output] = SimulateArena(Tsim, nBees, timestep)

%% plot initialization 
  FigureHandle = figure;
  hold on;
  set(FigureHandle, 'Position', [50,50,500,500]);
  set(FigureHandle, 'DoubleBuffer', 'on');
  %axis([-20 20 -20 20]);
  phi = linspace(0, 2*pi, 100);
  plotHandle = scatter(50 * cos(phi),50 * sin(phi), '.'); 
  hold;
  grid on;
  textHandle = text(6,8, sprintf('time: %4.3f', 0.0));
  textHandle2 = text(-10,8, sprintf('delta1: %4.3f', 0.0));
  textHandle3 = text(-3,8, sprintf('delta2: %4.3f', 0.0));
  textHandle4 = text(-10,5, sprintf('t1: %4.3f', 0.0));
  textHandle5 = text(0,5, sprintf('t2: %4.3f', 0.0));
  drawnow;
  
%% algorithm
  arena = InitializeArena();

  axis([-arena.radius arena.radius -arena.radius arena.radius]);
  
  bees = InitializeBees(nBees, arena);
  output = zeros(int16(length(arena.casu)), int16(6 * (Tsim - timestep) / timestep));
  for t = 0:timestep:Tsim
    bees = UpdateBees(bees, arena, timestep);
    arena = UpdateArena(arena, t, bees);
    for iCasu = 1 : length(arena.casu)
      output(iCasu, int16((t / timestep)*6 + 1) : int16((t / timestep)*6 + 6)) = arena.casu(iCasu).outputs;
    end
    
%% plot iterate 
    for i = 1 : sum(nBees)
      x(i) = bees(i).position.x;
      y(i) = bees(i).position.y;
    end
    set(plotHandle, 'xdata',x, 'ydata',y);
    set(textHandle, 'String', sprintf('time: %4.3f', t));
    set(textHandle2, 'String', sprintf('delta1: %4.3f', arena.casu(1).deltaTemp));
    set(textHandle3, 'String', sprintf('delta2: %4.3f', arena.casu(2).deltaTemp));
    set(textHandle4, 'String', sprintf('t1: %4.3f', arena.casu(1).temperature));
    set(textHandle5, 'String', sprintf('t2: %4.3f', arena.casu(2).temperature));
    drawnow;

  end
end
