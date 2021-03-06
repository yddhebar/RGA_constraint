% n_var = number of variables
% n_cons = number of constrains
%....feasible solutions have all constraints >= 0....
function evald_pop = evaluate_pop(pop)
    global opt
    pop_size = size(pop,1);
    evald_pop = pop;
    for i = 1:pop_size
        evald_pop(i,(opt.n_var+1):(opt.n_var + opt.n_cons + 2)) = evaluate_ind(pop(i,1:opt.n_var));
    end
end

%.. evald_ind = [n_cons,fitness,total_cons_violation]
function evald_ind = evaluate_ind(ind)
    global opt
    x = ind(1:opt.n_var);
    n_var = opt.n_var;
    evald_ind = zeros(1,opt.n_cons + 1 + 1);%...[constraints, fitness, cons_violation]
    
    switch opt.prob_name
        case 'sphere'
            func_value = dot(x,x);
            evald_ind(end - 1) = func_value;
        case 'ackley'
            s1 = dot(x,x);
            cx = cos(2*pi*x);
            s2 = sum(cx);
            func_value = -20*exp(-0.2*sqrt(s1/n_var)) -...
                exp(s2/n_var) + 20 + exp(1);
            evald_ind(end - 1) = func_value;
        case 'schwefel'
            func_value = 0;
            for i = 1:n_var
                s = sum(x(1:i));
                func_value = func_value + s^2;
            end
            evald_ind(end - 1) = func_value;
            
        case 'rastrigin'
            Ax = dot(x,x);
            Bx = sum(cos(2*pi*x));
            func_value = 10*n_var + Ax - 10*Bx;
            evald_ind(end - 1) = func_value;
        case 'ctp1'
            func_value = (x(1)^2 + x(2) - 11)^2 + (x(1) + x(2)^2 - 7)^2;
            g =zeros(1,2);
            g(1) = (4.84 - (x(1) - 0.05)^2 - (x(2) - 2.5)^2)/4.84;
            g(2) = (x(1)^2 + (x(2) - 2.5)^2 - 4.84)/4.84;
            
            g_vio = g < 0;
            total_cons_vio = -(sum(g(g_vio)));
            evald_ind = [g,func_value,total_cons_vio];
        case 'G1'%ctp3
            func_value = PrG1f(x);
            g = PrG1c(x)';
            g_vio = g > 0;
            total_cons_vio = (sum(g(g_vio)));
            evald_ind = [g,func_value,total_cons_vio];
            
        case 'G4'%ctp6
            func_value = PrG4f(x);
            g = PrG4c(x)';
            g_vio = g > 0;
            total_cons_vio = (sum(g(g_vio)));
            evald_ind = [g,func_value,total_cons_vio];
            
         case 'G7'%ctp8
            func_value = PrG7f(x);
            g = PrG7c(x)';
            g_vio = g > 0;
            total_cons_vio = (sum(g(g_vio)));
            evald_ind = [g,func_value,total_cons_vio];
            
        case 'G10'%ctp4
            func_value = PrG10f(x);
            g = PrG10c(x)';
            g_vio = g > 0;
            total_cons_vio = (sum(g(g_vio)));
            evald_ind = [g,func_value,total_cons_vio];
        otherwise
            disp('Problem not specified or coded')
    end

end