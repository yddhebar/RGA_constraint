%...report stats....
function report_stats(fv_ori,fe_ori)
global opt;
if opt.optimum_fitness == 0
    dov = 1;
else
    dov = abs(opt.optimum_fitness);
end

    
%statistics....
func_value_runs = fv_ori - opt.optimum_fitness;
succ_runs = func_value_runs <= 0.01*dov;
fe = fe_ori(succ_runs);
fv = func_value_runs(~succ_runs);

fprintf('S/F \t min \t avg \t med \t max\n');
fprintf('%dS \t %d \t %.2f \t %d \t %d \n',length(fe),min(fe),mean(fe),median(fe),max(fe));
fprintf('%dF \t %.2f \t %.2f \t %.2f \t %.2f \n',length(fv),min(fv),mean(fv),median(fv),max(fv));    
    
fv = fv_ori - opt.optimum_fitness;
p_ins = [1 2 5 10 20 50];
fprintf('\n')
for i = p_ins
    fprintf('<=%d%% \t',i);
end
fprintf('>%d%%\n',p_ins(end));

for i = p_ins
    n = length(fv(fv <= 0.01*i*dov));
    fprintf('%d \t',n);
end
n = length(fv(fv > 0.01*i*dov));
fprintf('%d \n',n);
end