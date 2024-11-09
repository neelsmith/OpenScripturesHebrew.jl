@testset "Test parsing language and part of speech"  begin
    f = joinpath(pwd(), "xmldata", "Gen.xml")
    wordlist = compilebook(f)
    typelist = [
        OSHFiniteVerb,
        OSHInfinitive, 
        OSHParticiple, 

        OSHNoun,
        OSHAdjective,
        OSHPronoun,
        OSHConjunction,
        OSHSuffix,

        OSHConjunction, OSHPreposition, OSHAdverb, OSHParticle

    ]
    for t in typelist
        records = filter(w -> parsecode(w.code) isa t, wordlist)
        code = records[1].code
        @info(string(code * " is a " ,  t))
        @test parsecode(code) isa t
    end
end

@testset "Test relation of forms and PoS types"  begin

    prtcl = parsecode("HTo")
    @test prtcl isa OSHParticle
    @test speechpart(prtcl) isa PoSParticle

    adv = parsecode("HD")
    @test adv isa OSHAdverb
    @test speechpart(adv) isa PoSAdverb

    prep = parsecode("HR")
    @test prep isa OSHPreposition
    @test speechpart(prep) isa PoSPreposition

    conj = parsecode("HC")
    @test conj isa OSHConjunction
    @test speechpart(conj) isa PoSConjunction

    sfx = parsecode("HSp3ms")
    @test sfx isa OSHSuffix
    @test speechpart(sfx) isa PoSSuffix

    pron = parsecode("HPdxcp") 
    @test pron isa OSHPronoun
    @test speechpart(pron) isa PoSPronoun

    adj = parsecode("HAamsa") 
    @test adj isa OSHAdjective
    @test speechpart(adj) isa PoSAdjective

    n = parsecode("HNcfsa")
    @test n isa OSHNoun
    @test speechpart(n) isa PoSNoun

    ptcpl = parsecode("HVprfsa")
    @test ptcpl isa OSHParticiple
    @test speechpart(ptcpl) isa PoSParticiple

    vrb = parsecode("HVqp3ms")
    @test vrb isa OSHFiniteVerb
    @test speechpart(vrb) isa PoSFiniteVerb

    inf = parsecode("HVhc") 
    @test inf isa OSHInfinitive
    @test speechpart(inf) isa PoSInfinitive
end