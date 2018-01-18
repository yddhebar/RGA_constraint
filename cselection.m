%..modified selection to handle nconstraints...
function sel_pop = cselection(pop)
global opt
fid = opt.n_var + opt.n_cons + 1;
pop_size = size(pop,1);
fes_fit_id = pop(:,fid + 1) == 0;
fes_fit = pop(fes_fit_id,fid);
nf = size(fes_fit,1);
if nf <= 1
    sel_pop = selection(pop);
    return
end

if isempty(fes_fit)
    fit_array = pop(:,fid+1);
elseif length(fes_fit) == size(pop,1)
    fit_array = pop(:,fid);
else
    avg_fit = mean(fes_fit);%(max(fes_fit) - min(fes_fit))/2;
    fit_array = pop(:,fid);
    fit_array(~fes_fit_id) = fit_array(~fes_fit_id) + pop(~fes_fit_id,fid + 1) + abs(avg_fit);
end

a1 = randperm(pop_size);
a2 = randperm(pop_size);

for i = 1:pop_size
    if fit_array(a1(i)) <= fit_array(a2(i))
        sel_pop(i,:) = pop(a1(i),:);
    else
        sel_pop(i,:) = pop(a2(i),:);
    end
end
end