@testset "Test parsing language"  begin
    code = "HVqp3ms"
    @test language(code) isa HebrewLanguage

    H = HebrewLanguage()
    @test pos(H, "HNcmpa") isa OSHNoun
    @test pos(H, "HVqp3ms") isa OSHVerb
end


# Noun code to test:  HNcmpa
# Verb code to test: HVqp3ms