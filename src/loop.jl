"""
    @loop begin
        body
    end

Repeatedly evaluate the body of the loop.

# Examples
```jldoctest
julia> i = 1
1

julia> @loop begin
           println(i)
           i += 1
           if i > 4
               break
           end
       end
1
2
3
4
```
"""
macro loop(body)
    quote
        while true
            $body
        end
    end |> esc
end
