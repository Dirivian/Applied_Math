function dy = model(t,y,params)
    N = params(1);
    r = params(2);
    d = params(3);
    w = params(4);
    prob = params(5);
    z = 1 - y(1) - y(2);
    f = y(1)/(y(1) + y(2));
    
    fc = 0;
    fd = 0;
    for S=2:N
        Pc_sum = 0;
        Pd_sum = 0;
        for m=0:(S-1)
           Pc = r/S * (1 - w^(m+1))/(1 - w) - 1;
           Pd = r/S * (1 - w^m)/(1 - w);
           Pc_sum = Pc_sum + Pc * nchoosek(S-1,m) * f^m * (1-f)^(S-1-m);
           Pd_sum = Pd_sum + Pd * nchoosek(S-1,m) * f^m * (1-f)^(S-1-m);
        end
        fc = fc + Pc_sum * nchoosek(N-1,S-1) * z^(N-S) * (1-z)^(S-1);
        fd = fd + Pd_sum * nchoosek(N-1,S-1) * z^(N-S) * (1-z)^(S-1);
    end

    dy = zeros(2,1);
    prob = 0.3 + 0.09.*randn(1);
    dy(1) = y(1)*(fc*z - d);
    dy(2) = y(2)*(fd*z - d -prob);
end