function bees = UpdateBees(oldBees, arena, timestep)
  global phiRange velocity dr maxTurn pWall pCongregate

  bees = oldBees;
  nBees = length(bees);
  for iBee = 1 : nBees
    gradient = CalculateGradient(bees(iBee).position, arena);
    if bees(iBee).W <= 0
      randPhi = rand() * phiRange * 2 - phiRange;
      r = rand();
      beta = double(r < bees(iBee).beta);
      % dPhi = beta * (bees(iBee).alpha * (atan2(gradient(2), gradient(1)) - bees(iBee).phi) + (1 - bees(iBee).alpha) * randPhi);
      % kad ide prema desno (0) gradijent ce bit 180*0.1=18 i s randomom ce
      % ostat prema nuli vise manje, problem je centriranje oko nule od
      % dPhi ali atan2-phi nije centrirano dobro
      phiGrad = atan2(gradient(2), gradient(1));
      if (phiGrad - bees(iBee).phi) > pi
        phiGrad = phiGrad - 2 * pi;
      elseif (phiGrad - bees(iBee).phi) < - pi
        phiGrad = phiGrad + 2 * pi;
      end
      dPhi = beta * (bees(iBee).alpha * (phiGrad - bees(iBee).phi) + (1 - bees(iBee).alpha) * randPhi);
%       if dPhi > pi
%         dPhi = dPhi - 2 * pi;
%       end
%       if dPhi < -pi
%         dPhi = dPhi + 2 * pi;
%       end
      %fprintf('phi:%f dPhi%f kutGrad%f °\n', bees(iBee).phi*180/pi, dPhi*180/pi, atan2(gradient(2), gradient(1))*180/pi)
      dPhi = max(min(dPhi, pi / 6), -pi / 6);
      %bees(iBee).phi = bees(iBee).phi + dPhi * timestep;
      bees(iBee).phi = bees(iBee).phi + dPhi;
      bees(iBee).position.x = bees(iBee).position.x + cos(bees(iBee).phi) * velocity * timestep;
      bees(iBee).position.y = bees(iBee).position.y + sin(bees(iBee).phi) * velocity * timestep;
      if (bees(iBee).position.x^2 + bees(iBee).position.y^2 >= (arena.radius - dr)^2)
        phiTmp = atan2(bees(iBee).position.y, bees(iBee).position.x);
        bees(iBee).position.x = (arena.radius - dr) * cos(phiTmp);
        bees(iBee).position.y = (arena.radius - dr) * sin(phiTmp);
        normal = phiTmp;
        bees(iBee).phi = bees(iBee).phi + sign(bees(iBee).phi - normal) * maxTurn * pi / 180;
        bees(iBee).phi = pi + normal;
        if bees(iBee).phi > pi
          bees(iBee).phi = bees(iBee).phi - 2 * pi;
        end
        r = rand();
        if r < pWall
          bees(iBee).W = GetWaitTime(GetTemperature(bees(iBee).position, arena));
        end
      end
      ds = (bees(iBee).C - bees(iBee).s) * timestep; % * exp( 60 * GetTemperature(bees(iBee).position, arena) / 26) / exp (60) ;
      bees(iBee).s = min(bees(iBee).s + ds, bees(iBee).C);
%       determinedTime = 0;
%       for jBee = 1 : iBee - 1
%         if (bees(iBee).position.x - bees(jBee).position.x)^2 + ...
%             (bees(iBee).position.y - bees(jBee).position.y)^2 < bees(iBee).s
%           r = rand();
%           if r < pCongregate || (determinedTime && bees(jBee).W > 0)
%             if determinedTime == 0
%               bees(iBee).W = GetWaitTime(GetTemperature(bees(iBee).position,arena));
%               determinedTime = 1;
%             end
%             bees(jBee).W = bees(iBee).W;
%           end
%         end
%       end
    else
      %dw = bees(iBee).kw * sqrt(gradient(1)^2 + gradient(2)^2);
      dw = 1;
      bees(iBee).W = bees(iBee).W - dw * timestep;
      bees(iBee).s = 0;
    end
  end
  
  for iBee = 1 : nBees
    if bees(iBee).W <= 0
      determinedTime = 0;
      for jBee = 1 : nBees
        if jBee ~= iBee
          if (bees(iBee).position.x - bees(jBee).position.x)^2 + ...
              (bees(iBee).position.y - bees(jBee).position.y)^2 < bees(iBee).s
            r = rand();
            if r < pCongregate || (determinedTime && bees(jBee).W > 0)
              if determinedTime == 0
                bees(iBee).W = GetWaitTime(GetTemperature(bees(iBee).position,arena));
                determinedTime = 1;
              end
              bees(jBee).W = bees(iBee).W;
            end
          end
        end
      end
    end
  end

end
