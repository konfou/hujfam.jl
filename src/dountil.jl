"""
    @dountil begin
        body
    end cond condition

Repeatedly evaluate a block, and end when condition is true.

# Examples
```jldoctest
julia> i = 1
1

julia> @dountil begin
           println(i)
           i += 1
       end cond i > 4
1
2
3
4
```
"""
macro dountil(body, cond::Symbol, condition)
    cond ≠ :cond && 
        error("@dountil expected `cond` got `$cond`")
    quote
        while true
            $body
            if $condition
                break
            end
        end
    end |> esc
end
