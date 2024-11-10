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

# Commented out: reconciling from Sefaria back to OSH
#=
function reconcile_ids(sefariatuple, oshwords)
    sform = sefariatuple.form
    sametoken = OSHMorphologicalForm[] #OpenScripturesHebrew.OSHPartOfSpeech[]
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
    results = NamedTuple[]
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


@time fullmorph = addmorph(sefariatuples[1:100])

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

struct MorphBDB
    urn::AbstractString
    form::AbstractString
    lemma::AbstractString
    bdbid::AbstractString
    morphology::Vector

end

function reconcile(book, psg; sefaria = sefariatuples, osh = oshwords)::Vector{NamedTuple}
    sefariaurn = "urn:cts:compnov:bible.$(book).masoretic_tokens:$(psg)."
    oshurn = "urn:cts:compnov:bible.$(book).osh:$(psg)"
    sefaria = filter(tup -> startswith(tup.urn, sefariaurn), sefariatuples)
    osh = filter(tup -> tup.urn == oshurn, oshwords)
    #output = []
    output = map(sefaria) do verb
        #reconciled = MorphBDB(verb.urn, verb.form, verb.lemma, verb.bdbid,reconcile_ids(verb, osh) ) 
        reconciled = (urn = verb.urn, form = verb.form, lemma = verb.lemma, bdbid = verb.bdbid, morphology = reconcile_ids(verb, osh))
        @info("Mapped sefaria verb to $(typeof(reconciled)))")

        #push!(output,reconciled)
        reconciled
    end
    output #|> Iterators.flatten |> collect
end

out = reconcile("genesis", "1.1")
=#


# Reconcile from OSH to Sefaria:
function oshreconcile(book, psg; sefaria = sefariatuples, osh = oshwords)#::Vector{NamedTuple}
    sefariaurn = "urn:cts:compnov:bible.$(book).masoretic_tokens:$(psg)."
    oshurn = "urn:cts:compnov:bible.$(book).osh:$(psg)"
    sefaria = filter(tup -> startswith(tup.urn, sefariaurn), sefariatuples)
    oshpassage = filter(tup -> tup.urn == oshurn, oshwords)

    plusmorph = NamedTuple[]
    for w in oshpassage
        if isverb(w)
            oshform = replace(w.otoken, "/" => "")
            @info("OSH string $(oshform)")

            sefaria = filter(tup -> startswith(tup.urn, sefariaurn), sefariatuples)
            @info("Reconcile with $(length(sefaria)) candidates: $(map(t -> t.form, sefaria))")
            ok = filter(t -> t.form == oshform, sefaria)
            @info("Matched on $(length(ok)) two BDB entries")
            bdblist = map(t -> (t.bdbid, t.lemma), ok)
            
            push!(plusmorph, (urn = w.urn, mtoken = w.mtoken, otoken = w.otoken, morph = parseword(w), otoken_num = w.otoken_num, oshid = w.lemma, bdb = bdblist))

        #=
for w in oshwords
        oshform = replace(w.otoken, "/" => "")
        #if w.mtoken == sform
        if oshform == sform
            push!(sametoken, parsecode(w.code))
        else
            #@info("Compare $(w.mtoken) with $(sform): no match")
        end
        
    end
            =#
        else
            #@info("process as OSH only")
            push!(plusmorph, (urn = w.urn, mtoken = w.mtoken, otoken = w.otoken, morph = parseword(w), otoken_num = w.otoken_num, oshid = w.lemma, bdb = []))
        end
    end
    plusmorph
end

oshout = oshreconcile("genesis", "1.1")
