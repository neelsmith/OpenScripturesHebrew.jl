
function resolvebdb(grouping)
    resolvebdb(grouping.lemma, grouping.mtoken)
end

function resolvebdb(oshlemma::AbstractString, token::AbstractString)
    #@info("Look for lemma $(oshlemma)")
    cleanlemma = split(oshlemma)[1]
    bdbpluses = bdbplus(token)
    if isempty(bdbpluses)
        @warn("No BDBPlus matches for $(token)")
    end

    results = []
    for bdbp in bdbpluses  
        strongentries = strong(bdbp)
        if isempty(strongentries)
            @warn("No Strong matches for $(BDBPlus)")
        end
        for s in strongentries
            
            if id(s) == cleanlemma
                #@info("We win on $(token) with strong id $(id(s))")
                push!(results, bdbid(bdbp))
            else
                #@info("No match: $(oshlemma) / $(id(s))")
                #push!( results, nothing)
            end
        end
    end 
    if isempty(results)
        @warn("No results for lemma $(oshlemma)")
    end
    results |> unique
end



   
