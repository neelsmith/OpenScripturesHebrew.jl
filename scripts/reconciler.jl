using OpenScripturesHebrew, BrownDriverBriggs

book = "genesis"

function sefariadata(bk = book)
    compdir = joinpath(pwd() |> dirname, "complutensian-texts", "data")
    f = joinpath(compdir, "$(bk).cex")
    map(readlines(f)[2:end]) do ln
        cols = split(ln, "|")
        (urn = cols[1],
        form = cols[2],
        lemma = cols[3], 
        bdbid = cols[4]
    )
    end
end

oshwords = singlebook("Gen")
sefariatuples = sefariadata()


function reconcile_ids(sefariatuple, oshwords)
    sform = sefariatuple.form
    sametoken = [] #OpenScripturesHebrew.OSHPartOfSpeech[]
    for w in oshwords
        oshform = replace(w.otoken, "/" => "")
        #if w.mtoken == sform
        if oshform == sform
            push!(sametoken, parsecode(w.code))
        else
            #@info("Compare $(w.mtoken) with $(sform): no match")
        end
        
    end
    sametoken
end


function addmorph(sefariaentries)
    results = []
    for verb in sefariaentries
        bookbase = replace(verb.urn, "urn:cts:compnov:bible." => "")
        book = replace(bookbase, r"\..+" => "")

        
        tokenpsg = replace(verb.urn, "urn:cts:compnov:bible.$(book).masoretic_tokens:" => "")
        psg = replace(tokenpsg, r".[^.]+$" => "")
        
        
        oshmatches = filter(oshwords) do w
            w.urn == "urn:cts:compnov:bible.$(book).osh:" * psg
        end    
        #@info("For $(verb.form) with id $(verb.bdbid) in $(psg), $(length(oshmatches)) candidate OSH tokens.")
        #try 
            reconciled = reconcile_ids(verb, oshmatches)
            push!(results, (urn = verb.urn, form = verb.form, lemma = verb.lemma, bdbid = verb.bdbid, morphology = reconciled))
        #catch e
            
        #end
        
        #@info("Matches: $(reconciled) $(typeof(reconciled))")
        
        
    end
    results
end


@time fullmorph = addmorph(sefariatuples)

labels = map(fullmorph) do v
    string(v.form, ", ", v.urn, ": ", length(v.morphology), " forms.")
end

println(join(labels,"\n"))

fails = filter(fullmorph) do m
    isempty(m.morphology)
end


faillabels = map(fails) do v
    string(v.form, ", ", v.urn, ": ", length(v.morphology), " forms.")
end
println(join(faillabels,"\n"))



function reconcile(book, psg; sefaria = sefariatuples, osh = oshwords)
    sefariaurn = "urn:cts:compnov:bible.$(book).masoretic_tokens:$(psg)."
    oshurn = "urn:cts:compnov:bible.$(book).osh:$(psg)"
    sefaria = filter(tup -> startswith(tup.urn, sefariaurn), sefariatuples)
    osh = filter(tup -> tup.urn == oshurn, oshwords)
    #output = []
    output = map(sefaria) do verb
        reconciled =  (urn = verb.urn, form = verb.form, lemma = verb.lemma, bdbid = verb.bdbid, morphology = reconcile_ids(verb, osh))
        @info(typeof(reconciled))
        #push!(output,reconciled)
        reconciled
        
    end
    output |> Iterators.flatten |> collect
end

out = reconcile("genesis", "1.1")
