"""
    @until condition begin
        body
    end

Repeatedly evaluate a conditional expression, and continue evaluating the
body of the loop as long as the condition remains false.

# Examples
```jldoctest
julia> i = 1
1

julia> @until i > 4 begin
           println(i)
           i += 1
       end
1
2
3
4
```
"""
macro until(condition, body)
    quote
        while ! $condition
            $body
        end
    end |> esc
end
