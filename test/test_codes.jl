@testset "Test parsing language and part of speech"  begin
    code = "HVqp3ms"
    @test language(code) isa HebrewLanguage

    H = HebrewLanguage()
    @test speechpart(H, "HNcmpa") isa OpenScripturesHebrew.PoSNoun
    @test speechpart(H, "HVqp3ms") isa OpenScripturesHebrew.PoSFiniteVerb
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


@testset "Test parsing infinitive verb codes"  begin
    code = "HVhc"
    inf = infinitive(code)
    @test inf isa OSHInfinitive
    @test conjugation(inf) isa OSHHiphil
    @test substantive_state(inf) isa OSHConstruct
   
end

@testset "Test parsing participle codes"  begin
    code = "HVprfsa"  # Verb piel participle active feminine singular absolute
    ptcpl = participle(code)
    @test ptcpl isa OSHParticiple
    @test conjugation(ptcpl) isa OSHPiel
    @test voice(ptcpl) isa OSHActive
    @test gender(ptcpl) isa OSHFeminine
    @test number(ptcpl) isa OSHSingular
    @test substantive_state(ptcpl) isa OSHAbsolute
end


@testset "Test parsing noun codes"  begin
    code = "HNcmpa"
end

