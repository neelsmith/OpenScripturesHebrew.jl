@testset "Test parsing language and part of speech"  begin
    f = joinpath(pwd(), "xmldata", "Gen.xml")
    wordlist = compilewords(f)
    typelist = [
        OSHFiniteVerb,
        OSHInfinitive, 
        OSHFiniteVerb, 
        OSHParticiple, 

        OSHNoun,
        OSHAdjective,
        OSHPronoun,
        OSHConjunction,
        OSHSuffix

    ]
    for t in typelist
        records = filter(w -> parsecode(w.code) isa t, wordlist)
        code = records[1].code
        @test parsecode(code) isa t
    end
end
