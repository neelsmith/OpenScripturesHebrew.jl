using EzXML
using OpenScripturesHebrew

f = joinpath(pwd(), "test", "xmldata", "Gen.xml")
parsed = readxml(f)

osis = OpenScripturesHebrew.OSIS
H = HebrewLanguage()


# Book:
book = findfirst("//osis:div", parsed.root, [ "osis" => osis])
# Chapters:
bookchapters = findall("./osis:chapter", book,  [ "osis" => osis])
# Verse:
chapterverses = findall("./osis:verse", bookchapters[1], [ "osis" => osis])

# Words of a sort:
wordlist = findall("./osis:w", chapterverses[1], [ "osis" => osis])


wordlist[1]

join(nodename.(attributes(wordlist[1])), ", ")



for (i, wd) in enumerate(wordlist)
    strval = nodecontent(wd)
    #@info(string(i,"..."))
    code = OpenScripturesHebrew.attributevalue(wd, "morph")
    
    posobject = pos(H, code)
    if isnothing(posobject)
        @info("Could not get part of speech from word $(i) with code $(code) and string $(strval)")
    else

        @info(string(strval,": ", posobject))
    end
end


for wd in nodecontent.(wordlist)
    if contains(wd, "/")
        @info("Slashy: " * wd)
    end
end


slashes = filter(nodecontent.(wordlist)) do w
    contains(w, "/")
end



for wd in nodecontent.(wordlist[1:100])
    @info(wd)
end