# todo: would like to accept a string or array
# todo: pushing into a set would be a way to ensure uniqueness, but set have no index
# todo: limit length of A to n = 9, n! is size of output -> 362880 permutations

"""
    permutations(A)

Heap's Algorithm

Return an Array of all permutations of A, there will be `n!` unique arrangements of the set

# Examples
```jldoctest
julia> A = ['M','K']
julia> permutations(A)
2-element Array{Any,1}:
 ['K', 'M']
 ['M', 'K']
```
"""    
function permutations(A)
# todo: is a set the best object to manage uniqueness?
#    info("collection not tested for member uniqueness")

    N = length(A)
    P = []

    function generate(X,n)
        println("n: $n    A1: $(X[1])   An: $(X[n])")
        
        if n == 1

            println("pushing A1: $(X[1])  An: $(X[n])") 
            push!(P,X)

        else
            for i = 1:n
                println("loop n: $n   i: $i    A1: $(X[1])  Ai:  $(X[i])  An: $(X[n])")
                generate(X,n-1)
                if iseven(n)
                    X[i], X[n] = X[n], X[i]
                else
                    X[1], X[n] = X[n], X[1]
                end
                println("swapped    A1: $(X[1])  Ai:  $(X[i])   An: $(X[n])")
            end
            # generate(X,n-1)
        end
    end

    generate(A,N)

    return P
end





#= pseudocode
procedure generate(n : integer, A : array of any):
    if n = 1 then
          output(A)
    else
        for i := 0; i < n - 1; i += 1 do
            generate(n - 1, A)
            if n is even then
                swap(A[i], A[n-1])
            else
                swap(A[0], A[n-1])
            end if
        end for
        generate(n - 1, A)
    end if
=#

    

# swap 
# built for the heaps algorithm, but not needed after all
"""
    swap(A)

Return a tuple that swaps the arguments

Superflous because `x, y = y, x` is just as clean

# Examples
```jldoctest
julia> swap('F',"respects")
("respects", 'F')
```
"""    
function swap(x::Any,y::Any)
    temp = x
    x = y
    y = temp
    return x, y
end

