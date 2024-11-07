
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

"""Download book from OSH github respeechpartitory and compile word list.
$(SIGNATURES)
"""
function compilewords_remote(bookname::AbstractString)
    if ! (bookname in collect(keys(bookids)))
        @warn("Book name $(bookname) not recognized.")
    else
        url = OSH_XML_GITHUB * bookname * ".xml"
        @info("Downloading $(url)...")
        f = Downloads.download(url)
        @info("Done.")
        words = compilewords(f)
        rm(f)
        words
    end
end


function torah()
    books = ["Gen", "Exod", "Lev", "Num", "Deut"]
    map(book -> compilewords_remote(book), books) |> Iterators.flatten |> collect
end



"""Parse file and compile a list of `w` elements keyed by URN.
$(SIGNATURES)
"""
function compilewords(f)
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

            for wrd in  findall("./osis:w", verse, [ "osis" => OSIS])
                otoken = nodecontent(wrd)

                codes = split(morphcode(wrd), "/")
                lemmas = split(lemma(wrd), "/")
                mtokens = split(otoken, "/")
                #if ! (length(codes) == length(lemmas) == length(mtokens))
                    #@warn("Unequal lists: $(lemmas), $(codes),  $(mtokens)")
                #end
                for (i, mtoken) in enumerate(mtokens)
                    codeval = i > 1 ? "H" * codes[i] : codes[i]
                    lemmaval =  speechpart(codeval) isa PoSSuffix ? "suffixed_object" : lemmas[i]
                        #@info("Suffix: $(length(lemmas)) lemmas / $(length(mtokens)) tokens")
                    #end
                    grouping = (urn = urn, code = codeval,  mtoken = mtoken, otoken = otoken, lemma = lemmaval)
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

"""Parse a morphological code into a mnorphological object.
$(SIGNATURES)
"""
function parsecode(code::AbstractString)
    lang = language(code)
    wordspeechpart = speechpart(lang, code)
    parseword(wordspeechpart, code)
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