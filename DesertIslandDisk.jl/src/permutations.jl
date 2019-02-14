# todo: would like to accept a string or array
#       split(A,"",keepempty=false) can split characters of string
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
#    info("collection not tested for member uniqueness")
    
    B = unique!(copy(A))            # original object unchanged
    N = length(B)
    P = []

    function generate(X,n)
        
        if n == 1

            push!(P,copy(X))        # rather than nest the references until final evaluation

        else
            for i = 1:n
                generate(X,n-1)

                if iseven(n)
                    X[i], X[n] = X[n], X[i]
                else
                    X[1], X[n] = X[n], X[1]
                end
            end
            # generate(X,n-1)       # this is an error apparently
        end
    end

    generate(B,N)

    return P
end


#= tests
AA = ['M','M','K']
A = ['M','K']
a = ['M']
B = ['M', 'K', 'S']
BB = ['M', 'K', 'S', 'S']
C = ['M', 'K', 'S', 'E']
=#

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

