
include("include/functions.jl");
include("data/preferences.jl");

using JuMP;
using Clp;
using CSV;
using DataFrames;
using GLPK;
using GLPKMathProgInterface;

using vOptGeneric;

m = vModel(solver = GLPKSolverMIP());
#m = Model(solver = GLPKSolverLP()); #initialize the model passing the solver in LP mode

@variables m begin #init the deviational variables
    dt[1:1,1:2] >= 0
    df[1:q,1:2] >= 0
    dm[1:q,1:2] >= 0
end

@variable(m, x[1:q] >= 0); #init the decision variable

@addobjective(m, Min,sum(dt./tgoal));
@addobjective(m, Min,sum(df./mq));
@addobjective(m, Min,sum(dm./mgoal));

#@objective(m, Min, (sum(dt./tgoal)
#           + sum(df./mq)
#           + sum(dm./mgoal)
#           )); #obj function

#Soft constraints
@constraint(m, N*(sum(x.*tax)) - dt[1,1] == tgoal); #tax minimization goal
@constraint(m, (N.*(x./base)) + ((df.* transpose([-1,1]))*[1,1]).== mq); #median seeker
@constraint(m, x + ((dm.* transpose([-1,1]))*[1,1]) .== mgoal); #management's goal

#Hard constraints
@constraint(m, N.*(x./base) .>= lq); #lower quartile constraints
@constraint(m, N.*(x./base) .<= uq); #upper quartile constraints

@constraint(m, sum((vcost + fcost./N + ((x).*(ones(3)+tax))).*(ones(3)+duties)) >= P); #final price condition
@constraint(m, sum((vcost + fcost./N + ((x).*(ones(3)+tax))).*(ones(3)+duties)) <= P + δ);

#print(m);
#status = solve(m)

solve( m, method = :lex)
printX_E(m)


solution=getvalue(x);
print(solution)


println("Objective value: ", getobjectivevalue(m));
println("x = ", solution);
println("dt = ", getvalue(dt));
println("df = ", getvalue(df));
println("dm = ", getvalue(dm));
