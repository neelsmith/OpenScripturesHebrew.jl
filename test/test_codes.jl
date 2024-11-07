@testset "Test parsing language and part of speech"  begin
    code = "HVqp3ms"
    @test language(code) isa HebrewLanguage

    H = HebrewLanguage()
    @test pos(H, "HNcmpa") isa PoSNoun
    @test pos(H, "HVqp3ms") isa PoSFiniteVerb
    # "HVqa"
end

@testset "Test parsing finite verb codes"  begin
     code = "HVqp3ms"
     
end

# Noun code to test:  HNcmpa
# Verb code to test: HVqp3ms

# Short verb codes:
#=
 "HVqc"
 "HVqa"
 "HVha"
 "HVhc"
 "HVpc"
 "HVNc"
 "HVNa"
 "HVpa"
 "HVPa"
 "HVHc"
 =#