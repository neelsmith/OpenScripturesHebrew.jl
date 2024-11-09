using OpenScripturesHebrew
using CitableBase, CitableText, CitableCorpus
compnovurl = "https://github.com/neelsmith/compnov/raw/main/corpus/compnov.cex"
corpus = fromcex(compnovurl, CitableTextCorpus, UrlReader)
vulgate = filter(psg -> versionid(psg.urn) == "vulgate", corpus.passages)
booklist = map(psg -> workid(psg.urn), vulgate) |> unique

@time words = singlebook("Dan")

bookwords = []
@time for bk in keys(OpenScripturesHebrew.bookids)
    @info("$(bk) / $(OpenScripturesHebrew.bookids[bk]) ...")
    push!(bookwords, singlebook(bk))
    # Verify that corresponding ID is in compnov corpus
    #if ! (OpenScripturesHebrew.bookids[bk] in booklist)
    #    @error("Bad book name: $(OpenScripturesHebrew.bookids[bk])")
    #end
end
allthewords = bookwords |> Iterators.flatten |> collect

# Suffixes not marked as lemmas!
# Ezra, Judges, Jeremiah
#
# Particles not marked:
# Daniel


#= 
using Downloads
using EzXML
url = OpenScripturesHebrew.OSH_XML_GITHUB * "Ezra.xml"
tmp = Downloads.download(url)
parsed = readxml(tmp)
rm(tmp)


O = OpenScripturesHebrew.OSIS

book = findfirst("//osis:div", parsed.root, [ "osis" => O])
bookchapters = findall("./osis:chapter", book,  [ "osis" => O])

wordlist = []
for chapter in bookchapters
    verses = findall("./osis:verse", chapter, [ "osis" => O])
    
    for verse in verses
        refstring = attributevalue(verse, "osisID")
        (bookid, chaptid, ref) = split(refstring, ".")
        @info(refstring * "\n")
        @info("\n")
        urn = "urn:cts:compnov:bible.judges.osh:$(chaptid).$(ref)"

        for wrd in  findall("./osis:w", verse, [ "osis" => O])
            otoken = nodecontent(wrd)
            codes = split(OpenScripturesHebrew.morphcode(wrd), "/")
            lemmas = split(OpenScripturesHebrew.lemma(wrd), "/")
            mtokens = split(otoken, "/")
            for (i, mtoken) in enumerate(mtokens)
                codeval = i > 1 ? "H" * codes[i] : codes[i]

                lemmaval = "lemma_unspecified"
                if speechpart(codeval) isa OpenScripturesHebrew.PoSSuffix
                    lemmaval = "suffixed_object"
                    
                else
                    lemmaval = lemmas[i]
                    
                end

                #=
                if i > length(lemmas)
                    #@warn("index $(i) for $(lemmas) in $(otoken) ($(mtokens))")
                    
                    
                    if speechpart(codeval) isa OpenScripturesHebrew.PoSSuffix
                        lemmaval = "suffixed_object"
                        @warn("unspecifed lemma becuase it's a suffix")
                    else
                        @warn("MYSTERY lemma $(mtokens[i]) following $(mtokens[i - 1])")
                        @warn("CODING:  $(speechpart(codeval))")
                    end

                else
                    lemmaval =  speechpart(codeval) isa OpenScripturesHebrew.PoSSuffix ? "suffixed_object" : lemmas[i]
                end
                  
                =#
                grouping = (urn = urn, code = codeval,  mtoken = mtoken, otoken = otoken, lemma = lemmaval)
                push!(wordlist, grouping)
            
           end
        end
    end
end

=#