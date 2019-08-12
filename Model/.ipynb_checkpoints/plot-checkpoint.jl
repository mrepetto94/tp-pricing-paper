using Plots, CSV;

resu = CSV.read("data/result.csv");
df = CSV.read("data/rho_permutations.csv");

resu = convert(Array{Float64},resu);
df = convert(Array{Int},df);

sresu= sum(resu,2);

pyplot();

xs = [string(df[i,:]) for i = 1:64];

plot(xs,sresu,xrotation=45,yaxis=("Sum of x", font(8, "serif")), xaxis=("Rho permutations", font(8, "serif")), palette = (:grays))
