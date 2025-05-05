%metalaxeis
function mutated = mutation(individual,mikos)
     thesi = mikos*rand;
     u1_min = -1;
     u1_max = 2;
     u2_min = -2;
     u2_max = 1;
     s_max = 1.1;
     s_min = 0.3;
     thesi = randi([1, mikos]);
     akeraio_meros = fix(thesi/5);
     modulo = mod(thesi,5);
      switch modulo
            case 1
                individual(akeraio_meros*5+modulo) = -1+2*rand;
            case 2
                individual(akeraio_meros*5+modulo) = u1_min + (u1_max - u1_min)*rand;
            case 3
                individual(akeraio_meros*5+modulo) = u2_min + (u2_max - u2_min)*rand;
            case 4
                individual(akeraio_meros*5+modulo) = s_min + (s_max - s_min)*rand;
            case 0
                individual(akeraio_meros*5+modulo) = s_min + (s_max - s_min)*rand;
      end
      mutated(:) = individual(:);
     
end


