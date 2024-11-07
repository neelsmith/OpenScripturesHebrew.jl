
const OSIS = "http://www.bibletechnologies.net/2003/OSIS/namespace"
const H = HebrewLanguage()
const A = AramaicLanguage()

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


"""Parse file and compile a list of `w` elements keyed by URN.
$(SIGNATURES)
"""
function compilewordlist(f)
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
                mtokens = split(otoken, "/")
                  for (i, mtoken) in enumerate(mtokens)
                    codeval = i > 1 ? "H" * codes[i] : codes[i]
                    grouping = (urn = urn, code = codeval, mtoken = mtoken, otoken = otoken)
                    push!(wordlist, grouping)
               end
            end
        end
    end
    wordlist
end


function parseword(n::EzXML.Node)
    code = morphcode(n)
    if isnothing(code)
        @error("Node $(n) ($(nodename(n))) does not have a morphology code.")
        nothing
    else
        parseword(code)
    end
end


# Dispatch by part of speech
function parsecode(code::AbstractString)
    lang = language(code)
    wordpos = pos(lang, code)
    parseword(wordpos, code)
end

function parseword(pos::OSHPartOfSpeech, code::AbstractString)
    @warn("parseword function not implemented for $(typeof(pos))")
end

function parseword(inf::PoSInfinitive, code::AbstractString)
    infinitive(code)
end