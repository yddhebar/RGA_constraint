%...niching based selection...
function sel_pop = NichedSelection(pop)
global opt
fid = opt.n_var + opt.n_cons + 1;
fes_pop_id = pop(:,fid+1) == 0;
fes_pop = pop(fes_pop_id,:);
infes_pop = pop(~fes_pop_id,:);
sel_infes_pop = [];
if ~isempty(infes_pop)
    sel_infes_pop = selection(infes_pop);
end

%..niched selection for feasible pop...
nn = 0.25*opt.pop_size;
t = 0.1;
fes_size = size(fes_pop,1);
if nn < (fes_size - 1)
    n = nn;
else
    n = fes_size - 1;
end
sel_fes_pop = zeros(size(fes_pop));
for i = 1:fes_size
    indv = fes_pop(i,:);
    a = randperm(fes_size);
    b = a(a ~=i);
    
    sel_id = i;
    for j = 1:n
        indj = fes_pop(b(j),:);
        d = norm_dist_indivs(indv,indj);
        if d <= t
            if indv(fid) > indj(fid)
                sel_id = j;
            end
            break
        end
    end
    if sel_id ~= i
        sel_fes_pop(i,:) = fes_pop(b(sel_id),:);
    else
        sel_fes_pop(i,:) = fes_pop(i,:);
    end
end
sel_pop = [sel_fes_pop;sel_infes_pop];
end


function d = norm_dist_indivs(ind1,ind2)
global opt
r = opt.U_bounds  - opt.L_bounds;
v = ind1(1:opt.n_var) - ind2(1:opt.n_var);
nv = v./(r');
d = norm(nv)*1/(sqrt(opt.n_var));
end