%..preserving elites....
function elite_pop = MergeReduce(pop1,pop2)
global opt;
merged_pop = [pop1;pop2];

elite_pop = MR2(merged_pop);
end

function elite_pop = MR1(merged_pop)
global opt
fit_array = merged_pop(:,opt.n_var + opt.n_cons + 1:opt.n_var + opt.n_cons + 2);
[~,s_id] = sortrows(fit_array,[2,1]);
elite_pop = merged_pop(s_id(1:opt.pop_size),:);
end

function elite_pop = MR2(pop)
global opt
fid = opt.n_var + opt.n_cons + 1;
fes_fit_id = pop(:,fid + 1) == 0;
fes_fit = pop(fes_fit_id,fid);
if isempty(fes_fit)
    fit_array = pop(:,fid+1);
elseif length(fes_fit) == size(pop,1)
    fit_array = pop(:,fid);
else
    avg_fit = mean(fes_fit);%(max(fes_fit) - min(fes_fit))/2;
    fit_array = pop(:,fid);
    fit_array(~fes_fit_id) = fit_array(~fes_fit_id) + pop(~fes_fit_id,fid + 1) + abs(avg_fit);
end
[~,s_id] = sort(fit_array);
elite_pop = pop(s_id(1:opt.pop_size),:);
end