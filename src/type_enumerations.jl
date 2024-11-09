# Enumeration of languages:
struct HebrewLanguage <: OSHLanguage end
struct AramaicLanguage <: OSHLanguage end

# Enumeration of parts of speech:
struct PoSAdjective <: OSHPartOfSpeech end
struct PoSConjunction <: OSHPartOfSpeech end
struct PoSAdverb <: OSHPartOfSpeech end
struct PoSNoun <: OSHPartOfSpeech end
struct PoSPronoun <: OSHPartOfSpeech end
struct PoSParticle <: OSHPartOfSpeech end
struct PoSPreposition <: OSHPartOfSpeech end
struct PoSSuffix <: OSHPartOfSpeech end

struct PoSParticiple <: OSHPartOfSpeech end
struct PoSInfinitive <: OSHPartOfSpeech end
struct PoSFiniteVerb <: OSHPartOfSpeech end


# Enumeration of conjugations:
struct OSHQal <: OSHConjugation end
function label(c::OSHQal)
    "qal"
end
struct OSHHiphil <: OSHConjugation end
function label(c::OSHHiphil)
    "hiphil"
end
struct OSHPiel <: OSHConjugation end
function label(c::OSHPiel)
    "piel"
end
struct OSHNiphal <: OSHConjugation end
function label(c::OSHNiphal)
    "niphal"
end
struct OSHPual <: OSHConjugation end
function label(c::OSHPual)
    "pual"
end
struct OSHHophal <: OSHConjugation end
function label(c::OSHHophal)
    "hophal"
end
struct OSHTiphil <: OSHConjugation end
function label(c::OSHTiphil)
    "tiphil (?)"
end
struct OSHQalPassive <: OSHConjugation end
function label(c::OSHQalPassive)
    "qal (passive)"
end
struct OSHHishtaphel <: OSHConjugation end
function label(c::OSHHishtaphel)
    "histhaphel (?)"
end
struct OSHHithpalpel <: OSHConjugation end
function label(c::OSHHithpalpel)
    "hithpalpel (?)"
end
struct OSHPolel <: OSHConjugation end
function label(c::OSHPolel)
    "polel (?)"
end
struct OSHHithpolel <: OSHConjugation end
function label(c::OSHHithpolel)
    "hithpolel (?)"
end
struct OSHPilpel <: OSHConjugation end
function label(c::OSHPilpel)
    "pipel (?)"
end
struct OSHPalel <: OSHConjugation end
function label(c::OSHPalel)
    "palel (?)"
end
struct OSHPoel <: OSHConjugation end
function label(c::OSHPoel)
    "poel (?)"
end
struct OSHHothpaal <: OSHConjugation end
function label(c::OSHHothpaal)
    "hothpaal (?)"
end
struct OSHNithpael <: OSHConjugation end
function label(c::OSHNithpael)
    "nithpael (?)"
end
struct OSHPoal <: OSHConjugation end
function label(c::OSHPoal)
    "poal (?)"
end
struct OSHPolpal <: OSHConjugation end
function label(c::OSHPolpal)
    "polpal (?)"
end
struct OSHPulal <: OSHConjugation end
function label(c::OSHPulal)
    "pulal (?)"
end
struct OSHPolal <: OSHConjugation end
function label(c::OSHPolal)
    "polal (?)"
end
struct OSHHithpoel <: OSHConjugation end
function label(c::OSHHithpoel)
    "hithpoel (̣̣̣?)"
end
struct OSHPealal <: OSHConjugation end
function label(c::OSHPealal)
    "pealal (?)"
end
struct OSHPilel <: OSHConjugation end
function label(c::OSHPilel)
    "pilel (?)"
end

# Enumeration of verbtypes:
struct OSHPerfect <: OSHVerbType end
function label(c::OSHPerfect)
    "perfect"
end
struct OSHSequentialPerfect <: OSHVerbType end
function label(c::OSHSequentialPerfect)
    "sequential perfect"
end
struct OSHImperfect <: OSHVerbType end
function label(c::OSHImperfect)
    "imperfect"
end
struct OSHSequentialImperfect <: OSHVerbType end
function label(c::OSHSequentialImperfect)
    "sequential imperfect"
end
struct OSHJussive <: OSHVerbType end
function label(c::OSHJussive)
    "jussive"
end
struct OSHImperative <: OSHVerbType end
function label(c::OSHImperative)
    "imperative"
end
struct OSHCohortative <: OSHVerbType end
function label(c::OSHCohortative)
    "cohortative"
end

# Enumeration of persons:
struct OSHFirstPerson <: OSHPerson end
function label(p::OSHFirstPerson)
    "first"
end
struct OSHSecondPerson <: OSHPerson end
function label(p::OSHSecondPerson)
    "second"
end
struct OSHThirdPerson <: OSHPerson end
function label(p::OSHThirdPerson)
    "third"
end


# Enumeration of number:
struct OSHSingular <: OSHNumber end
function label(n::OSHSingular)
    "singular"
end
struct OSHPlural <: OSHNumber end
function label(n::OSHPlural)
    "plural"
end
struct OSHDual <: OSHNumber end
function label(n::OSHDual)
    "dual"
end

# Enumeration of gender:
struct OSHMasculine <: OSHGender end
function label(g::OSHMasculine)
    "masculine"
end
struct OSHFeminine <: OSHGender end
function label(g::OSHFeminine)
    "feminine"
end
struct OSHCommon <: OSHGender end
function label(g::OSHCommon)
    "common gender"
end

# Enumeration of values for voice:
struct OSHActive <: OSHVoice end
struct OSHPassive <: OSHVoice end

# Enumeration of noun states:
struct OSHAbsolute <: OSHSubstantiveState end
struct OSHConstruct <: OSHSubstantiveState end
struct OSHDetermined <: OSHSubstantiveState end

# Enumeration of noun types:
struct OSHCommonNoun <: OSHNounType end
struct OSHProperName <: OSHNounType end
struct OSHGentilic <: OSHNounType end

# Enumeration of adjective types:
struct OSHSimpleAdjective <: OSHAdjectiveType end
struct OSHCardinalNumber <: OSHAdjectiveType end
struct OSHOrdinalNumber <: OSHAdjectiveType end
struct OSHGentilicAdjective <: OSHAdjectiveType end

# Enumeration of pronoun types:
struct OSHDemonstrative <: OSHPronounType end
struct OSHIndefinite <: OSHPronounType end
struct OSHInterrogative <: OSHPronounType end
struct OSHPersonal <: OSHPronounType end
struct OSHRelative <: OSHPronounType end
