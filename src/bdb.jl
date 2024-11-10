
# Reconcile from OSH to Sefaria:
function add_bdb(oshbook, psg, oshwords = tanakh(); sefariasource = [])
    book = bookids[oshbook]
    sefariatuples = isempty(sefariasource) ? sefariadata(book) : sefariasource


    sefariaurn = "urn:cts:compnov:bible.$(book).masoretic_tokens:$(psg)."
    oshurn = "urn:cts:compnov:bible.$(book).osh:$(psg)"
    sefaria = filter(tup -> startswith(tup.urn, sefariaurn), sefariatuples)
    oshpassage = filter(tup -> tup.urn == oshurn, oshwords)

    plusmorph = NamedTuple[]
    for w in oshpassage
        if isverb(w)
            oshform = replace(w.otoken, "/" => "")
            sefaria = filter(tup -> startswith(tup.urn, sefariaurn), sefariatuples)
            @debug("Reconcile with $(length(sefaria)) candidates: $(map(t -> t.form, sefaria))")
            ok = filter(t -> t.form == oshform, sefaria)
            @debug("Matched on $(length(ok)) two BDB entries")
            bdblist = map(t -> (t.bdbid, t.lemma), ok)
            
            push!(plusmorph, (urn = w.urn, mtoken = w.mtoken, otoken = w.otoken, morph = parseword(w), otoken_num = w.otoken_num, oshid = w.lemma, bdb = bdblist))

        else
            push!(plusmorph, (urn = w.urn, mtoken = w.mtoken, otoken = w.otoken, morph = parseword(w), otoken_num = w.otoken_num, oshid = w.lemma, bdb = []))
        end
    end
    plusmorph
 
end



function sefariadata(book)
    
    sefariaurl = string(
        "https://raw.githubusercontent.com/neelsmith/complutensian-texts/refs/heads/main/data/",
        book, ".cex")
    sefariafile = Downloads.download(sefariaurl)    
    sefariatuples =  map(readlines(sefariafile)[2:end]) do ln
            cols = split(ln, "|")
            (urn = cols[1],
            form = cols[2],
            lemma = cols[3], 
            bdbid = cols[4]
        )
    end
    @info("Downloaded Sefaria data")
    rm(sefariafile)
    
    sefariatuples
end