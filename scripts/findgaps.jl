using OpenScripturesHebrew

words = tanakh()

parses = []
for (i, w) in enumerate(words)
    @info("$(i)")
    parsed = parsetuple(w)
    if isnothing(parsed)
        @error("$(w.mtoken) : $(speechpart(w.code)) $(w.code)")
    else
        push!(parses, parsed)
    end
end


@time allparses = map(w -> parsetuple(w), words)

filter(p -> isnothing(p), allparses) |> length
filter(w -> speechpart(w.code) isa PoSPronoun, words) |> length

hebrewwords = filter(w -> typeof(language(w.code)) isa HebrewLanguage(), words)