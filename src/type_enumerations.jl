# Enumeration of languages:
struct HebrewLanguage <: OSHLanguage end
function show(io::IO, pos::HebrewLanguage)
    print(io, "Hebrew")
end
struct AramaicLanguage <: OSHLanguage end
function show(io::IO, pos::AramaicLanguage)
    print(io, "Aramaic")
end

# Enumeration of parts of speech:
struct PoSAdjective <: OSHPartOfSpeech end
function show(io::IO, pos::PoSAdjective)
    print(io, "adjective")
end
struct PoSConjunction <: OSHPartOfSpeech end
function show(io::IO, pos::PoSConjunction)
    print(io, "conjunction")
end
struct PoSAdverb <: OSHPartOfSpeech end
function show(io::IO, pos::PoSAdverb)
    print(io, "adverb")
end
struct PoSNoun <: OSHPartOfSpeech end
function show(io::IO, pos::PoSNoun)
    print(io, "noun")
end
struct PoSPronoun <: OSHPartOfSpeech end
function show(io::IO, pos::PoSPronoun)
    print(io, "pronoun")
end
struct PoSParticle <: OSHPartOfSpeech end
function show(io::IO, pos::PoSParticle)
    print(io, "particle")
end
struct PoSPreposition <: OSHPartOfSpeech end
function show(io::IO, pos::PoSPreposition)
    print(io, "preposition")
end
struct PoSSuffix <: OSHPartOfSpeech end
function show(io::IO, pos::PoSSuffix)
    print(io, "suffix")
end
struct PoSParticiple <: OSHPartOfSpeech end
function show(io::IO, pos::PoSParticiple)
    print(io, "participle")
end
struct PoSInfinitive <: OSHPartOfSpeech end
function show(io::IO, pos::PoSInfinitive)
    print(io, "infinitive")
end
struct PoSFiniteVerb <: OSHPartOfSpeech end
function show(io::IO, pos::PoSFiniteVerb)
    print(io, "finite verb")
end

# Enumeration of conjugations:
struct OSHQal <: OSHConjugation end
function show(io::IO, c::OSHQal)
    print(io, "qal")
end
struct OSHHiphil <: OSHConjugation end
function show(io::IO, c::OSHHiphil)
    print(io, "hiphil")
end
struct OSHPiel <: OSHConjugation end
function show(io::IO, c::OSHPiel)
    print(io, "piel")
end
struct OSHNiphal <: OSHConjugation end
function show(io::IO, c::OSHNiphal)
    print(io, "niphal")
end
struct OSHPual <: OSHConjugation end
function show(io::IO, c::OSHPual)
    print(io, "pual")
end
struct OSHHophal <: OSHConjugation end
function show(io::IO, c::OSHHophal)
    print(io, "hophal")
end
struct OSHTiphil <: OSHConjugation end
function show(io::IO, c::OSHTiphil)
    print(io, "tiphil (?)")
end
struct OSHQalPassive <: OSHConjugation end
function show(io::IO, c::OSHQalPassive)
    print(io, "qal (passive)")
end
struct OSHHishtaphel <: OSHConjugation end
function show(io::IO, c::OSHHishtaphel)
    print(io, "histaphel (?)")
end
struct OSHHithpalpel <: OSHConjugation end
function show(io::IO, c::OSHHithpalpel)
    print(io, "hithpalpel (?)")
end
struct OSHPolel <: OSHConjugation end
function show(io::IO, c::OSHPolel)
    print(io, "polel (?)")
end
struct OSHHithpolel <: OSHConjugation end
function show(io::IO, c::OSHHithpolel)
    print(io, "hithpolel (?)")
end
struct OSHPilpel <: OSHConjugation end
function show(io::IO, c::OSHPilpel)
    print(io, "pilpel (?)")
end
struct OSHPalel <: OSHConjugation end
function show(io::IO, c::OSHPalel)
    print(io, "palel (?)")
end
struct OSHPoel <: OSHConjugation end
function show(io::IO, c::OSHPoel)
    print(io, "poel (?)")
end
struct OSHHothpaal <: OSHConjugation end
function show(io::IO, c::OSHHothpaal)
    print(io, "hothpaal (?)")
end
struct OSHNithpael <: OSHConjugation end
function show(io::IO, c::OSHNithpael)
    print(io, "nithpael (?)")
end
struct OSHPoal <: OSHConjugation end
function show(io::IO, c::OSHPoal)
    print(io, "poal (?)")
end
struct OSHPolpal <: OSHConjugation end
function show(io::IO, c::OSHPolpal)
    print(io, "polpal (?)")
end
struct OSHPulal <: OSHConjugation end
function show(io::IO, c::OSHPulal)
    print(io, "pulal (?)")
end
struct OSHPolal <: OSHConjugation end
function show(io::IO, c::OSHPolal)
    print(io, "polal (?)")
end
struct OSHHithpoel <: OSHConjugation end
function show(io::IO, c::OSHHithpoel)
    print(io, "hithpoel (?)")
end
struct OSHPealal <: OSHConjugation end
function show(io::IO, c::OSHPealal)
    print(io, "pealal (?)")
end
struct OSHPilel <: OSHConjugation end
function show(io::IO, c::OSHPilel)
    print(io, "pilel (?)")
end

# Enumeration of verbtypes:
struct OSHPerfect <: OSHVerbType end
function show(io::IO, v::OSHPerfect)
    print(io, "perfect")
end
struct OSHSequentialPerfect <: OSHVerbType end
function show(io::IO, v::OSHSequentialPerfect)
    print(io, "sequential perfect")
end
struct OSHImperfect <: OSHVerbType end
function show(io::IO, v::OSHImperfect)
    print(io, "imperfect")
end
struct OSHSequentialImperfect <: OSHVerbType end
function show(io::IO, v::OSHSequentialImperfect)
    print(io, "sequential imperfect")
end
struct OSHJussive <: OSHVerbType end
function show(io::IO, v::OSHJussive)
    print(io, "jussive")
end
struct OSHImperative <: OSHVerbType end
function show(io::IO, v::OSHImperative)
    print(io, "imperative")
end
struct OSHCohortative <: OSHVerbType end
function show(io::IO, v::OSHCohortative)
    print(io, "cohortative")
end

# Enumeration of persons:
struct OSHFirstPerson <: OSHPerson end
function show(io::IO, p::OSHFirstPerson)
    print(io, "first")
end
struct OSHSecondPerson <: OSHPerson end
function show(io::IO, p::OSHSecondPerson)
    print(io, "second")
end
struct OSHThirdPerson <: OSHPerson end
function show(io::IO, p::OSHThirdPerson)
    print(io, "third")
end


# Enumeration of number:
struct OSHSingular <: OSHNumber end
function show(io::IO, n::OSHSingular)
    print(io, "singular")
end
struct OSHPlural <: OSHNumber end
function show(io::IO, n::OSHPlural)
    print(io, "plural")
end
struct OSHDual <: OSHNumber end
function show(io::IO, n::OSHDual)
    print(io, "dual")
end

# Enumeration of gender:
struct OSHMasculine <: OSHGender end
function show(io::IO, g::OSHMasculine)
    print(io, "masculine")
end
struct OSHFeminine <: OSHGender end
function show(io::IO, g::OSHFeminine)
    print(io, "feminine")
end
struct OSHCommon <: OSHGender end
function show(io::IO, g::OSHCommon)
    print(io, "common gender")
end

# Enumeration of values for voice:
struct OSHActive <: OSHVoice end
function show(io::IO, v::OSHActive)
    print(io, "active")
end
struct OSHPassive <: OSHVoice end
function show(io::IO, v::OSHPassive)
    print(io, "passive")
end

# Enumeration of noun states:
struct OSHAbsolute <: OSHSubstantiveState end
function show(io::IO, st::OSHAbsolute)
    print(io, "absolute")
end
struct OSHConstruct <: OSHSubstantiveState end
function show(io::IO, st::OSHConstruct)
    print(io, "construct")
end
struct OSHDetermined <: OSHSubstantiveState end
function show(io::IO, st::OSHDetermined)
    print(io, "determined")
end

# Enumeration of noun types:
struct OSHCommonNoun <: OSHNounType end
function show(io::IO, nt::OSHCommonNoun)
    print(io, "common noun")
end
struct OSHProperName <: OSHNounType end
function show(io::IO, nt::OSHProperName)
    print(io, "proper name")
end
struct OSHGentilic <: OSHNounType end
function show(io::IO, nt::OSHGentilic)
    print(io, "gentilic")
end

# Enumeration of adjective types:
struct OSHSimpleAdjective <: OSHAdjectiveType end
function show(io::IO, a::OSHSimpleAdjective)
    print(io, "simple adjective")
end
struct OSHCardinalNumber <: OSHAdjectiveType end
function show(io::IO, a::OSHCardinalNumber)
    print(io, "cardinal number")
end
struct OSHOrdinalNumber <: OSHAdjectiveType end
function show(io::IO, a::OSHOrdinalNumber)
    print(io, "ordinal number")
end
struct OSHGentilicAdjective <: OSHAdjectiveType end
function show(io::IO, a::OSHGentilicAdjective)
    print(io, "gentilic adjective")
end

# Enumeration of pronoun types:
struct OSHDemonstrative <: OSHPronounType end
function show(io::IO, pron::OSHDemonstrative)
    print(io, "demonstrative")
end
struct OSHIndefinite <: OSHPronounType end
function show(io::IO, pron::OSHIndefinite)
    print(io, "indefinite")
end
struct OSHInterrogative <: OSHPronounType end
function show(io::IO, pron::OSHInterrogative)
    print(io, "interrogative")
end
struct OSHPersonal <: OSHPronounType end
function show(io::IO, pron::OSHPersonal)
    print(io, "personal")
end
struct OSHRelative <: OSHPronounType end
function show(io::IO, pron::OSHRelative)
    print(io, "relative")
end
