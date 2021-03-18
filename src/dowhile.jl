"""
    @dowhile begin
        body
    end cond condition

Repeatedly evaluate a block, and end when condition is false.

# Examples
```jldoctest
julia> i = 1
1

julia> @dowhile begin
           println(i)
           i += 1
       end cond i <= 4
1
2
3
4
```
"""
macro dowhile(body, cond::Symbol, condition)
    cond ≠ :cond && 
        error("@dowhile expected `cond` got `$cond`")
    quote
        while true
            $body
            if ! $condition
                break
            end
        end
    end |> esc
end
