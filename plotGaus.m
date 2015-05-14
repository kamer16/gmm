function plotGaus(Mu, S, color)
    ncir = 50;
    theta = linspace(0, 2 * pi, ncir);
    croix = [-0.1, +0.1 , 0 ,0 ; 0 , 0, -0.1, +0.1];

    [V D] = eig(S);
    px = [cos(theta); sin(theta)];
    Px = V * D * px + repmat(Mu, 1, ncir);
    Croix = V * D * croix + repmat(Mu, 1, 4);
    line(Px(1,:), Px(2,:), 'color', color);
    line(Croix(1, 1:2), Croix(2, 1:2), 'color', color);
    line(Croix(1, 3:4), Croix(2, 3:4), 'color', color);
    grid on
    axis equal
end
