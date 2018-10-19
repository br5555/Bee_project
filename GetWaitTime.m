function t = GetWaitTime(temp)
  
  global maxWait
  % t = 5 * ((temp)/28)^2;
  t = maxWait * (exp(1 / 6 * temp) - 1) / (exp(6) - 1);

end
