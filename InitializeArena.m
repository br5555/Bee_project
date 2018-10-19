function arena = InitializeArena()

  arena.radius = 10; %cm
  arena.surroundTemp = 28;
  arena.casuRange = 60;
  
  arena.casu(1).position.x = 0;
  arena.casu(1).position.y = 0;
  arena.casu(1).vibrate = 0;
  arena.casu(1).airflow = 0;
  arena.casu(1).temperature = 33;
  arena.casu(1).sigma.x = 10;
  arena.casu(1).sigma.y = 10;
  arena.casu(1).setpointTemp = 33;
  arena.casu(1).deltaTemp = arena.casu(1).setpointTemp - arena.casu(1).temperature;
  arena.casu(1).changeStart = 0;
  arena.casu(1).outputs(1:6) = zeros(1,6);
  
  arena.casu(2).position.x = 4;
  arena.casu(2).position.y = 4;
  arena.casu(2).vibrate = 0;
  arena.casu(2).airflow = 0;
  arena.casu(2).temperature = 28;
  arena.casu(2).sigma.x = 10;
  arena.casu(2).sigma.y = 10;
  arena.casu(2).setpointTemp = 28;
  arena.casu(2).deltaTemp = arena.casu(2).setpointTemp - arena.casu(2).temperature;
  arena.casu(2).changeStart = 0;
  arena.casu(2).outputs(1:6) = zeros(1,6);
  
  
  
end
