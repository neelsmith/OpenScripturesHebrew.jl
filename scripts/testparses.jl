using EzXML
using OpenScripturesHebrew
f = joinpath(pwd(), "test", "xmldata", "Gen.xml")
parsed = readxml(f)

osis = OpenScripturesHebrew.OSIS

# Book:
div1 = findfirst("//osis:div", parsed.root, [ "osis" => osis])

# Chapter:
gen1 = findfirst("//osis:chapter", div1,  [ "osis" => osis])

# Verse:P
gen1_1 = findfirst("//osis:verse", gen1, [ "osis" => osis])

# WOrds mamybe
wordlist = findall("//osis:w", gen1_1, [ "osis" => osis])


wordlist[1]

join(nodename.(attributes(wordlist[1])), ", ")

H = HebrewLanguage()



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