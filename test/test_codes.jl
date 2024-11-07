@testset "Test parsing language and part of speech"  begin
    code = "HVqp3ms"
    @test language(code) isa HebrewLanguage

    H = HebrewLanguage()
    @test pos(H, "HNcmpa") isa OpenScripturesHebrew.PoSNoun
    @test pos(H, "HVqp3ms") isa OpenScripturesHebrew.PoSFiniteVerb
    # "HVqa"
end

@testset "Test parsing finite verb codes"  begin
    code = "HVqp3ms"
    vrb = finiteverb(code)
    @test vrb isa OSHFiniteVerb
    @test conjugation(vrb) isa OSHQal
    @test verbtype(vrb) isa  OSHPerfect
    @test gender(vrb) isa OSHMasculine
    @test number(vrb) isa OSHSingular
    @test person(vrb) isa OSHThirdPerson
end

# Noun code to test:  HNcmpa
# Verb code to test: HVqp3ms

