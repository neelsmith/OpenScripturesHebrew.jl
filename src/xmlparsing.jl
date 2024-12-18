
const OSIS = "http://www.bibletechnologies.net/2003/OSIS/namespace"
const H = HebrewLanguage()
const A = AramaicLanguage()

const OSH_XML_GITHUB = "https://raw.githubusercontent.com/openscriptures/morphhb/refs/heads/master/wlc/"

"""Get value of attribute. Returns nothing if no such attribute.
$(SIGNATURES)
"""
function attributevalue(n::EzXML.Node, attrname)
    matches = filter(attributes(n)) do attr
        nodename(attr) == attrname
    end
    isempty(matches) ? nothing : nodecontent(matches[1])
end

"""Get value of morphology code for a `w` element.
$(SIGNATURES)
"""
function morphcode(n::EzXML.Node)
    attributevalue(n,"morph")
end

"""Get value of morphology code for a `w` element.
$(SIGNATURES)
"""
function lemma(n::EzXML.Node)
    attributevalue(n,"lemma")
end

"""Download book from OSH github repository and compile word list.
$(SIGNATURES)
"""
function singlebook(bookname::AbstractString)
    if ! (bookname in collect(keys(bookids)))
        @warn("Book name $(bookname) not recognized.")
    else
        url = OSH_XML_GITHUB * bookname * ".xml"
        @info("Downloading $(url)...")
        f = Downloads.download(url)
        @info("Done.")
        words = compilebook(f)
        rm(f)
        words
    end
end

"""Download books of the Torah from the OSH github repository and compile word list.
$(SIGNATURES)
"""
function torah()
    books = ["Gen", "Exod", "Lev", "Num", "Deut"]
    map(book -> singlebook(book), books) |> Iterators.flatten |> collect
end


"""Download books of the Prophets from the OSH github repository and compile word list.
$(SIGNATURES)
"""
function prophets()
    books = ["Josh", "Judg", "2Sam", "1Kgs", "2Kgs",
        "Isa", "Jer", "Ezek", 
        "Hos", "Joel", "Amos", "Obad", "Jonah", "Mic", "Nah", "Hab", "Zeph", "Hag", "Zech", "Mal"
    ]
    map(book -> singlebook(book), books) |> Iterators.flatten |> collect
end


"""Download books of the Writings from the OSH github repository and compile word list.
$(SIGNATURES)
"""
function writings()
    books = ["Ps", "Prov", "Job", "Song","Ruth","Lam","Eccl", "Esth","Dan","Ezra", "Neh", "2Chr"]
    map(book -> singlebook(book), books) |> Iterators.flatten |> collect
end


"""Download the Hebrew Bible, book by book, from the OSH github repository and compile word list.
$(SIGNATURES)
"""
function tanakh()
    [torah(), prophets(), writings()] |> Iterators.flatten |> collect
end

function tanach()
    tanakh()
end

"""Parse file and compile a list of `w` elements keyed by URN.
$(SIGNATURES)
"""
function compilebook(f)
    wordlist = []
    parsed = readxml(f)
    book = findfirst("//osis:div", parsed.root, [ "osis" => OSIS])
    # Chapters:
    bookchapters = findall("./osis:chapter", book,  [ "osis" => OSIS])
    for chapter in bookchapters
        # Verses:
        verses = findall("./osis:verse", chapter, [ "osis" => OSIS])
        for verse in verses
            refstring = attributevalue(verse, "osisID")
            (bookid, chaptid, ref) = split(refstring, ".")
            # URN for verse:
            urn = "urn:cts:compnov:bible.$(bookids[bookid]).osh:$(chaptid).$(ref)"

            otkn_count = 0
            for wrd in  findall("./osis:w", verse, [ "osis" => OSIS])
                otoken = nodecontent(wrd)
                otkn_count = otkn_count + 1

                codes = split(morphcode(wrd), "/")
                lemmas = split(lemma(wrd), "/")
                mtokens = split(otoken, "/")
      
                for (i, mtoken) in enumerate(mtokens)
                    codeval = i > 1 ? "H" * codes[i] : codes[i]

                    lemmaval = "non_hebrew"
                    # We're only good for hebrew right now
                    if language(codeval) isa HebrewLanguage
                        if speechpart(codeval) isa OpenScripturesHebrew.PoSSuffix
                            lemmaval = "suffixed_object"      
                        elseif speechpart(codeval) isa OpenScripturesHebrew.PoSParticle
                            lemmaval = "particle"
                        else
                            if i > length(lemmas)
                                @warn("at $(refstring) unspecified lemma for $(mtokens[i]) following $(mtokens[i - 1])")
                                @warn("coded as:  $(speechpart(codeval))")
                                lemmaval = "unspecified_lemma"
                            else
                                lemmaval = lemmas[i]
                            end
                        end
                    end
                    grouping = (urn = urn, code = codeval,  mtoken = mtoken, otoken = otoken, otoken_num = otkn_count, lemma = lemmaval)
                    push!(wordlist, grouping)
                
               end
            end
        end
    end
    wordlist
end

"""Parse an XML Node into a morphological object.
$(SIGNATURES)
"""
function parseword(n::EzXML.Node)
    code = morphcode(n)
    if isnothing(code)
        @error("Node $(n) ($(nodename(n))) does not have a morphology code.")
        nothing
    else
        parseword(code)
    end
end



function parsetuple(tupl)
    parsecode(tupl.code)
end

"""Parse a morphological code into a mnorphological object.
$(SIGNATURES)
"""
function parsecode(code::AbstractString)
    lang = language(code)
    wordspeechpart = speechpart(lang, code)
    isnothing(wordspeechpart) ? nothing : parseword(wordspeechpart, code)
end


"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function parseword(speechpart::OSHPartOfSpeech, code::AbstractString)
    @warn("parseword function not implemented for $(typeof(speechpart))")
    nothing
end


"""Parse a code for an infinitive form into a morphological object.
$(SIGNATURES)
F"""
function parseword(inf::PoSInfinitive, code::AbstractString)
    infinitive(code)
end

"""Parse a code for a finite verb form into a morphological object.
$(SIGNATURES)
F"""
function parseword(inf::PoSFiniteVerb, code::AbstractString)
    finiteverb(code)
end



"""Parse a code for a suffixed object into a morphological object.
$(SIGNATURES)
F"""
function parseword(inf::PoSSuffix, code::AbstractString)
    suffix(code)
end


"""Parse a code for a noun into a morphological object.
$(SIGNATURES)
F"""
function parseword(inf::PoSNoun, code::AbstractString)
    noun(code)
end

"""Parse a code for a noun into a morphological object.
$(SIGNATURES)
F"""
function parseword(inf::PoSPronoun, code::AbstractString)
    pronoun(code)
end

"""Parse a code for a noun into a morphological object.
$(SIGNATURES)
F"""
function parseword(inf::PoSAdjective, code::AbstractString)
    adjective(code)
end


"""Parse a code for a conjunction into a morphological object.
$(SIGNATURES)
"""
function parseword(inf::PoSConjunction, code::AbstractString)
    conjunction(code)
end



"""Parse a code for a preposition into a morphological object.
$(SIGNATURES)
"""
function parseword(inf::PoSPreposition, code::AbstractString)
    preposition(code)
end


"""Parse a code for an adverb into a morphological object.
$(SIGNATURES)
"""
function parseword(inf::PoSAdverb, code::AbstractString)
    adverb(code)
end


"""Parse a code for a participle into a morphological object.
$(SIGNATURES)
"""
function parseword(inf::PoSParticiple, code::AbstractString)
    participle(code)
end


"""Parse a code for a particle into a morphological object.
$(SIGNATURES)
"""
function parseword(inf::PoSParticle, code::AbstractString)
    particle(code)
end

function parseword(tpl::NamedTuple)
    parsecode(tpl.code)
end