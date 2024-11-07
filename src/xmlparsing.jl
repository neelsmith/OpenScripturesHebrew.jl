
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
function compilewords(f)
    wordlist = []
    parsed = readxml(f)
    book = findfirst("//osis:div", parsed.root, [ "osis" => OSIS])
    # Chapters:
    bookchapters = findall("./osis:chapter", book,  [ "osis" => OSIS])
    for chapter in bookchapters
        
        
        # Verse:
        verses = findall("./osis:verse", chapter, [ "osis" => OSIS])
        for verse in verses
            refstring = attributevalue(verse, "osisID")
            (bookid, chaptid, ref) = split(refstring, ".")
            urn = "urn:cts:compnov:bible.$(bookids[bookid]).masoretic:$(chaptid).$(ref)"

            for wrd in  findall("./osis:w", verse, [ "osis" => OSIS])
                tkn = nodecontent(wrd)
                pairing = (urn = urn, code = morphcode(wrd), token = tkn)
                push!(wordlist, pairing)
            end
        end
    end
    wordlist
end


function parseword(n::EzXML.Node)
end