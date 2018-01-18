%..best individual...
function [] = best_individual(pop)
global g_vars
global opt
fid = opt.n_var + opt.n_cons + 1;
[sorted_fit_array,s_id] = sortrows(pop(:,fid:fid+1),[2,1]);
curr_best = pop(s_id(1),:);

if curr_best(fid+1) == g_vars.best_ind(fid+1)
    if curr_best(fid) < g_vars.best_ind(fid)
        g_vars.best_ind = curr_best;
    end
elseif (curr_best(fid+1) == 0) && (g_vars.best_ind(fid+1) > 0)
    g_vars.best_ind = curr_best;
elseif (curr_best(fid+1) > 0) && (g_vars.best_ind(fid+1) > 0)
    if curr_best(fid+1) < g_vars.best_ind(fid+1)
        g_vars.best_ind = curr_best; 
    end
end

end