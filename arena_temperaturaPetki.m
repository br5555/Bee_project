% 3D prikaz temperature u prostoru 
global temp_lokal2_x temp_lokal2_y temp_lokal3_x temp_lokal3_y
global A
arena = InitializeArena();
l = 15*15;
n = 100; 
x_min = -30; x_max = 30; 
y_min = -30; y_max = 30; 
A = zeros(n,n); 
x = linspace(x_min,x_max,n); 
y = linspace(y_min,y_max,n); 
% temp_max = arena.casu(1).temperature;
% temp_lokal=  arena.casu(2).temperature;
% temp_x_centar = arena.casu(1).position.x; 
% temp_y_centar = arena.casu(1).position.y;
% temp_lokal1_x = arena.casu(2).position.x;
% temp_lokal1_y = arena.casu(2).position.y;


for i=1:n
  for j=1:n
    position.x = x(i);
    position.y = y(j);
    A(i,j)= GetTemperature(position, arena);
    if sqrt(x(i)^2+y(j)^2) > 30^2
     A(i,j)=0;
    end
  end
end

figure
surf(x,y,A);
zlim([min(A(A>0)) max(max(A))]);
xlabel('x'); ylabel('y');
colormap colorcube;
%view([90 270]);