"""
    @repeat times begin
        body
    end

Repeatedly evaluate body for the specified number of times.
"""
macro repeat(times, body)
    quote
        for i = 1:$times
            $body
        end
    end |> esc
end
