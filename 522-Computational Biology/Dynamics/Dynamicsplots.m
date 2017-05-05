subplot(2,2,1)
dynasim(8,3.0,0.5,0.99,0.99);
xlim([0 1]);
ylim([0 1]);
xlabel('Pop. density x+y');
ylabel('Coop fraction x/(x+y)');
title('w = 0.99');
subplot(2,2,2)
dynasim(8,3.0,0.5,0.8,0.99);
xlim([0 1]);
ylim([0 1]);
xlabel('Pop. density x+y');
ylabel('Coop fraction x/(x+y)');
title('w = 0.8');
subplot(2,2,3)
dynasim(8,3.0,0.5,1.2,0.99);
xlim([0 1]);
ylim([0 1]);
xlabel('Pop. density x+y');
ylabel('Coop fraction x/(x+y)');
title('w = 1.2');
subplot(2,2,4)
dynasim(8,3.0,0.5,1.4,0.99);
xlim([0 1]);
ylim([0 1]);
xlabel('Pop. density x+y');
ylabel('Coop fraction x/(x+y)');
title('w = 1.4');