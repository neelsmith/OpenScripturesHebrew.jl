@testset "Test parsing OSIS XML"  begin
    @info(pwd())
    f = joinpath(pwd(), "xmldata", "Gen.xml")
    wordlist = compilewords(f)
    @test length(wordlist) > 32000
end