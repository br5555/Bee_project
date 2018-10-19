
FigureHandle = figure;
hold on;
set(FigureHandle, 'Position', [50,50,500,200]);
set(FigureHandle, 'DoubleBuffer', 'on');
axis([-50 50 -50 50]);

phi = linspace(0, 2*pi, 100);
plotHandle = plot(50 * cos(phi),50 * sin(phi));
%textHandle = text(30, 0.25, sprintf('best: %4.3f', 0.0));
hold off;
drawnow;

for i = 1 : nBees
  x(i) = bees(i).position.x;
  y(i) = bees(i).position.y;
end
  
set(plotHandle, x, y);
%set(textHandle, 'String', sprintf('best: %4.3f', maximumFitness));
drawnow;
