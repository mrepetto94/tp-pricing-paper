using JuMP;
using Clp;
using CSV;
using DataFrames;
using GLPK;
using GLPKMathProgInterface;

include("include/functions.jl");
include("data/preferences.jl");

rhocb = CSV.read("data/rho_permutations.csv");
rhocb = convert(Matrix{Float64},rhocb);


### Weight sensitivity with zero robustness ###
w = CSV.read("data/weight-sense.csv");
w = w[:,2:4];
n = nrow(w);
###############################################

res = DataFrame(X1 = Float64[],X2 = Float64[],X3 = Float64[]);

j = 1;

#for j = 1:1
#### Robustness attribute ################
ρ = rhocb[64,:];
##########################################

m = Model(solver = ClpSolver());


@variables m begin #init the variables
    dt[1:1,1:2] >= 0
    df[1:q,1:2] >= 0
    dm[1:q,1:2] >= 0
    π[1:q,1:2] >= 0
    ζ[1:2]>=0
    x[1:q] >= 0
end

#@objective(m, Min, (w[1]*sum(dt./tgoal))
#           + (w[2]*sum(df./mq))
#           + (w[3]*sum(dm./mgoal))
#           ); #obj function

@objective(m, Min, (w[1,1]*sum(dt./tgoal))
           + (w[2,1]*sum(df./mq))
           + (w[3,1]*sum(dm./mgoal))
           ); #obj function


@constraint(m, N*(sum(x.*tax)) + sum(π[:,1]) + (ρ[1]*ζ[1]) - dt[1,1] == tgoal); #obj 1

@constraint(m, (N.*(x./base)) + ((df.* transpose([-1,1]))*[1,1]).== mq - ((θ[:,4]./q).*ρ[2])); #obj 2

@constraint(m, x + ((dm.* transpose([-1,1]))*[1,1]) .== mgoal); #obj 3

for i=1:q #create the robust constraint for obj 1 and con 1
    @constraint(m,ζ[1]+π[i,1] >= θ[i,1]*x[i]);
    @constraint(m,ζ[2]+π[i,2] >= θ[i,2]*x[i]);
end

for i=0:ρ[2] #create the robust constraint for obj 2
    @constraint(m, N.*(x./base) .>= lq - ((θ[:,3]./q).*i));
    @constraint(m, N.*(x./base) .<= uq - ((θ[:,5]./q).*i));
end

@constraint(m, sum((vcost + fcost./N + ((x).*(ones(3)+tax))).*(ones(3)+duties)) + sum(π[:,2]) + (ρ[3]*ζ[2]) >= P) #final price condition
@constraint(m, sum((vcost + fcost./N + ((x).*(ones(3)+tax))).*(ones(3)+duties)) + sum(π[:,2]) + (ρ[3]*ζ[2]) <= P + δ);

status = solve(m);

b = getvalue(x);
pi = getvalue(π);
z = getvalue(ζ);

push!(res, getvalue(x));

#end

CSV.write("data/result-weight-sense.csv",res)

#res = 0
