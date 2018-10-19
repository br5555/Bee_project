function arena = SensorUpdate(oldArena, bees, nBees, iCasu)

  arena = oldArena;
  for iSensor = 1 : 6
    updated = false;
    iBee = 1;
    while ~updated && iBee <= nBees
      dX = arena.casu(iCasu).position.x - bees(iBee).position.x;
      dY = arena.casu(iCasu).position.y - bees(iBee).position.y;
      radius = sqrt(dX^2 + dY^2);
      if radius < 2.5
        phi = (atan2(dY, dX) + pi/2) * 180 / pi;
        lower = (iSensor - 1) * 60 - arena.casuRange / 2;
        upper = (iSensor - 1) * 60 + arena.casuRange / 2;
        if (((phi > lower) && (phi < upper)) ...
            || ((phi + 360 > lower) && (phi + 360 < upper)))
          arena.casu(iCasu).outputs(iSensor) = 1;
          updated = true;
        end
      end
      iBee = iBee + 1;
    end
    if ~updated
      arena.casu(iCasu).outputs(iSensor) = 0;
    end
  end
%   if sum(arena.casu(iCasu).outputs) > 0
%     'a'
%   end
end