function dynasim(N,r,d,w, prob)

    params = [N r d w, prob];
    tspan = linspace(0,100,1001);

    [t,y] = ode45(@(t,y) model(t,y,params), tspan, [0.9; 0.1]);
    [t,y1] = ode45(@(t,y) model(t,y,params), tspan, [0.7; 0.3]);
    [t,y2] = ode45(@(t,y) model(t,y,params), tspan, [0.5; 0.5]);
    [t,y3] = ode45(@(t,y) model(t,y,params), tspan, [0.3; 0.7]);
        [t,y4] = ode45(@(t,y) model(t,y,params), tspan, [0.1; 0.9]);
    [t,y4] = ode45(@(t,y) model(t,y,params), tspan, [0.05; 0.95]);

    plot(y(:,1) + y(:,2), y(:,1)./(y(:,1) + y(:,2)));
    hold on;
    plot(y1(:,1) + y1(:,2), y1(:,1)./(y1(:,1) + y1(:,2)));
    plot(y2(:,1) + y2(:,2), y2(:,1)./(y2(:,1) + y2(:,2)));
    plot(y3(:,1) + y3(:,2), y3(:,1)./(y3(:,1) + y3(:,2)));
    plot(y4(:,1) + y4(:,2), y4(:,1)./(y4(:,1) + y4(:,2)));
    hold off
end