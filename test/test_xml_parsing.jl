@testset "Test parsing OSIS XML"  begin
    f = joinpath(pwd(), "xmldata", "Gen.xml")
    wordlist = compilebook(f)
    @test length(wordlist) > 32000
end