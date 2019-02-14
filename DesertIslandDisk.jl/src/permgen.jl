# This seems to work on its own, the push is using a hidden name or the reference is not updated
# solution was pushing a copy of the array to P.

function permgen(X,n)
    
    if n == 1
        for k in X
            print("$k ")    # these print the correct values
        end
        println()

        push!(P,X)   # this is not pushing the current values of X into P. reference outer scope?

    else
        for i = 1:n
            permgen(X,n-1)
            if iseven(n)
                X[i], X[n] = X[n], X[i]
            else
                X[1], X[n] = X[n], X[1]
            end
        end
        # permgen(X,n-1)  # apparently this is incorrectly called
    end
end

#= test
P = []
C = ['M', 'K', 'S', 'E']
permgen(C,4)

factorial(4)
24
=#
