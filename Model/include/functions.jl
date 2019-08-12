
function evaluate(base,fun,fcost,vcost,N,P) 
    if fun == "manufacturer"
        return (fcost + (N*vcost))
    elseif fun == "distributor"
        return (N*P)
    else
        return base
    end
end

function robustify(coefficients, deviation)
    return convert(Matrix,coefficients) .* convert(Matrix,deviation)
end
