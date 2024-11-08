using OpenScripturesHebrew

#words = compilewords_remote("Gen")
words = tanakh()


for (i, w) in enumerate(words)
    @info("$(i)")
    if isnothing(parsetuple(w))
        @info("$(w.mtoken) : $(speechpart(w.code)) $(w.code)")
    end
end