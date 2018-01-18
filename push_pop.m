%....non_uniform_push
function pushed_pop = push_pop(pop,sink,gen)
pushed_pop = pop;
pop_size = size(pop,1);
%adaptive eta...
eta_push = adaptive1(gen);

%eta_push = 0*gen/3000;
for i = 1:pop_size
    pushed_pop(i,:) = push_ind(pop(i,:),sink,eta_push);
end
end

function pushed_ind = push_ind(ind,sink,eta)
global opt
global g_vars
pushed_ind = ind;
for j = 1:opt.n_var
    a = opt.L_bounds(j);
    b = opt.U_bounds(j);
    x = ind(j);
    x_b = sink(j);
    x_pushed = x;
    if abs(x - x_b) >= g_vars.EPS
        if (x < x_b) && (x > a)
            x_pushed = a + ((x - a)*(x_b - a)^eta)^(1/(1+eta));
        elseif (x > x_b) && (x < b)
            x_pushed = b - ((b - x)*(b - x_b)^eta)^(1/(1+eta));
        end
        
        if x_pushed < a
            x_pushed = a;
        elseif x_pushed > b
            x_pushed = b;
        end
    end
    pushed_ind(j) = x_pushed;
end
end

function pushed_ind = push_ind2(ind,sink,eta)
global opt
global g_vars
pushed_ind = ind;
p = 0.5;% percentage....
for j = 1:opt.n_var
    a = opt.L_bounds(j);
    b = opt.U_bounds(j);
    x = ind(j);
    x_b = sink(j);
    x_pushed = x;
    if abs(x - x_b) >= g_vars.EPS
        if (x < x_b) && (x > a)
            xL = a + (x_b - a)*((1-p)^(1/(1+eta)));
            if x >= xL
                x_pushed = a + ((x - a)*(x_b - a)^eta)^(1/(1+eta));
            end
        elseif (x > x_b) && (x < b)
            xR = b - (b - x_b)*(p^(1/(1+eta)));
            if x <= xR
                x_pushed = b - ((b - x)*(b - x_b)^eta)^(1/(1+eta));
            end
        end
        
        if x_pushed < a
            x_pushed = a;
        elseif x_pushed > b
            x_pushed = b;
        end
    end
    pushed_ind(j) = x_pushed;
end
end

function pushed_ind = push_ind3(ind,sink,eta)
%...attenuate push near bounds...
global opt
global g_vars
pushed_ind = ind;
tau = 0.9;
for j = 1:opt.n_var
    a = opt.L_bounds(j);
    b = opt.U_bounds(j);
    x = ind(j);
    x_b = sink(j);
    x_pushed = x;
    d_a = x_b - a;
    d_b = b - x_b;
    a_b = b - a;
    flag = 0;
    if (d_a/a_b < tau) || (d_b/a_b < tau)
        flag = 1;
    end
    if (abs(x - x_b) >= g_vars.EPS) && (flag == 0)
        if (x < x_b) && (x > a)
            x_pushed = a + ((x - a)*(x_b - a)^eta)^(1/(1+eta));
        elseif (x > x_b) && (x < b)
            x_pushed = b - ((b - x)*(b - x_b)^eta)^(1/(1+eta));
        end
    end
    if x_pushed < a
        x_pushed = a;
    elseif x_pushed > b
        x_pushed = b;
    end
    pushed_ind(j) = x_pushed;
end
end

function eta_push = adaptive1(gen)
jumps = 6;
if rem(gen,jumps) <= (jumps/2)
    eta_push = 0;
else
    eta_push = 1;
end
end

function eta_push = adaptive2(gen)
jumps = 9;
if rem(gen,jumps) <= (jumps/3)
    eta_push = 0;
elseif rem(gen,jumps) <= (2*jumps/3)
    eta_push = 1;
else
    eta_push = 40;
end
end