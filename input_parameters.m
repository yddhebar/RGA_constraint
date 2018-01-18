%..input parameters...
function [opt] = input_parameters()
prob_name = 'sphere';
switch prob_name
    case 'sphere'
        opt.pop_size = 100;
        opt.max_gen = 1000;
        opt.n_cons = 0;%..number of constraints...
        opt.n_var = 20;
        opt.L_bounds = 0*ones(opt.n_var,1);
        opt.U_bounds = 10*ones(opt.n_var,1);
        opt.p_xover = 0.9;
        opt.p_mut = 1.0/opt.n_var;
        opt.eta_xover = 2;
        opt.eta_mut = 15;
        opt.max_runs = 5;
        opt.prob_name = 'sphere';
        opt.radius = 0.01;
        opt.eps = 0.01;
        opt.n_desired_optima = 48;
        opt.optimum_fitness = 0.0;
    case 'ctp1'
        opt.pop_size = 50;
        opt.max_gen = 50;
        opt.n_cons = 2;%..number of constraints...
        opt.n_var = 2;
        opt.L_bounds = 0*ones(opt.n_var,1);
        opt.U_bounds = 6*ones(opt.n_var,1);
        opt.p_xover = 0.9;
        opt.p_mut = 0.1;
        opt.eta_xover = 2;
        opt.eta_mut = 15;
        opt.max_runs = 50;
        opt.prob_name = 'ctp1';
        opt.radius = 0.01;
        opt.eps = 0.01;
        opt.n_desired_optima = 48;
        opt.optimum_fitness = 13.59085;
            
    case 'G1'
        opt.pop_size = 130;
        opt.max_gen = 500;
        opt.n_cons = 9;%..number of constraints...
        opt.n_var = 13;
        opt.L_bounds = 0*ones(opt.n_var,1);
        opt.U_bounds = [ones(9,1);100;100;100;1];
        opt.p_xover = 0.9;
        opt.p_mut = 1.0/opt.n_var;
        opt.eta_xover = 2;
        opt.eta_mut = 15;
        opt.max_runs = 50;
        opt.prob_name = 'G1';
        opt.radius = 0.01;
        opt.eps = 0.01;
        opt.n_desired_optima = 48;
        opt.optimum_fitness = -15;
        
    case 'G4'
        opt.pop_size = 50;
        opt.max_gen = 5000;
        opt.n_cons = 6;%..number of constraints...
        opt.n_var = 5;
        opt.L_bounds = [78,33,27,27,27]';
        opt.U_bounds = [102,45,45,45,45]';
        opt.p_xover = 0.9;
        opt.p_mut = 1.0/opt.n_var;
        opt.eta_xover = 2;
        opt.eta_mut = 15;
        opt.max_runs = 50;
        opt.prob_name = 'G4';
        opt.radius = 0.01;
        opt.eps = 0.01;
        opt.n_desired_optima = 48;
        opt.optimum_fitness = -30665.539;
        
    case 'G7'
        opt.pop_size = 100;
        opt.max_gen = 3500;
        opt.n_cons = 8;%..number of constraints...
        opt.n_var = 10;
        opt.L_bounds = -10*ones(opt.n_var,1);
        opt.U_bounds = 10*ones(opt.n_var,1);
        opt.p_xover = 0.9;
        opt.p_mut = 1.0/opt.n_var;
        opt.eta_xover = 2;
        opt.eta_mut = 15;
        opt.max_runs = 50;
        opt.prob_name = 'G7';
        opt.radius = 0.01;
        opt.eps = 0.01;
        opt.n_desired_optima = 48;
        opt.optimum_fitness = 24.3062091;
        
    case 'G10'
        opt.pop_size = 80;
        opt.max_gen = 4000;
        opt.n_cons = 6;%..number of constraints...
        opt.n_var = 8;
        opt.L_bounds = 10*[10,100,100,1,1,1,1,1]';
        opt.U_bounds = 1000*[10,10,10,1,1,1,1,1]';
        opt.p_xover = 0.9;
        opt.p_mut = 1.0/opt.n_var;
        opt.eta_xover = 2;
        opt.eta_mut = 15;
        opt.max_runs = 50;
        opt.prob_name = 'G10';
        opt.radius = 0.01;
        opt.eps = 0.01;
        opt.n_desired_optima = 48;
        opt.optimum_fitness = 7049.3307;
        opt.niching = 1;
end