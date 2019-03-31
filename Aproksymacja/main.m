function val = main()
figure(1)
 val = zeros(1,2);
 R = approximateresistor(@base, 1,cell2mat(struct2cell(load('dane_resistor.mat'))));
 disp("Szacowany opór rezystora: " + R + " Om")
figure(2)

 T = approximateselectionsort(@base,2,cell2mat(struct2cell(load('dane_selectionsort.mat'))));
 val(1,1) = R;
 val(1,2) = T;
 disp("Czas wykonania dla N = 18000: " + T + " s")