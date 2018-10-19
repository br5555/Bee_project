function arena = UpdateArena(oldArena, t, bees)
  
  nBees = length(bees);
  tau = 20;
  arena = oldArena;
  for iCasu = 1 : length(arena.casu)
    %% temperature update
    if abs(arena.casu(iCasu).setpointTemp - arena.casu(iCasu).temperature) > 0 && ...
        (arena.casu(iCasu).deltaTemp == 0)
      arena.casu(iCasu).deltaTemp = arena.casu(iCasu).setpointTemp - ...
        arena.casu(iCasu).temperature;
    end
    if abs(arena.casu(iCasu).setpointTemp - arena.casu(iCasu).temperature) >= 0.2 
      arena.casu(iCasu).temperature = arena.casu(iCasu).deltaTemp *...
        (1 - exp(-(t - arena.casu(iCasu).changeStart)/ tau)) + ...
        (arena.casu(iCasu).setpointTemp - arena.casu(iCasu).deltaTemp);
      if abs(arena.casu(iCasu).setpointTemp - arena.casu(iCasu).temperature) < 0.2
        arena.casu(iCasu).deltaTemp = 0;
        arena.casu(iCasu).temperature = arena.casu(iCasu).setpointTemp;
      end
    end
    %% sensor update
     arena = SensorUpdate(arena, bees, nBees, iCasu);
%     for iSensor = 1 : 6
%       updated = false;
%       iBee = 1;
%       while ~updated && iBee <= nBees
%         dX = arena.casu(iCasu).position.x - bees(iBee).position.x;
%         dY = arena.casu(iCasu).position.y - bees(iBee).position.y;
%         radius = sqrt(dX^2 + dY^2);
%         if radius < 2
%           phi = (atan2(dY, dX) + pi/2) * 180 / pi;
%           lower = (iSensor - 1) * 60 - arena.casuRange / 2;
%           upper = (iSensor - 1) * 60 + arena.casuRange / 2;
%           if (((phi > lower) && (phi < upper)) ...
%               || ((phi + 360 > lower) && (phi + 360 < upper)))
%             arena.casu(iCasu).outputs(iSensor) = 1;
%             updated = true;
%           end
%         end
%         iBee = iBee + 1;
%       end
%       if ~updated
%         arena.casu(iCasu).outputs(iSensor) = 0;
%       end
%     end
  end
  
%   if t == 70
%     arena.casu(2).setpointTemp = 28;
%     arena.casu(2).deltaTemp = 0;
%     arena.casu(2).changeStart = t;
%   end
%   if t == 0
%     arena.casu(1).setpointTemp = 36;
%     arena.casu(1).deltaTemp = 0;
%     arena.casu(1).changeStart = t;
%   end
  % algoritam upravljanja CASUima

  
end
