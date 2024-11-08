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
struct OSHHiphil <: OSHConjugation end
struct OSHPiel <: OSHConjugation end
struct OSHNiphal <: OSHConjugation end
struct OSHPual <: OSHConjugation end
struct OSHHophal <: OSHConjugation end
struct OSHTiphil <: OSHConjugation end
struct OSHQalPassive <: OSHConjugation end
struct OSHHishtaphel <: OSHConjugation end
struct OSHHithpalpel <: OSHConjugation end
struct OSHPolel <: OSHConjugation end
struct OSHHithpolel <: OSHConjugation end
struct OSHPilpel <: OSHConjugation end
struct OSHPalel <: OSHConjugation end
struct OSHPoel <: OSHConjugation end
struct OSHHothpaal <: OSHConjugation end
struct OSHNithpael <: OSHConjugation end
struct OSHPoal <: OSHConjugation end
struct OSHPolpal <: OSHConjugation end
struct OSHPulal <: OSHConjugation end
struct OSHPolal <: OSHConjugation end
struct OSHHithpoel <: OSHConjugation end
struct OSHPealal <: OSHConjugation end
struct OSHPilel <: OSHConjugation end

# Enumeration of verbtypes:
struct OSHPerfect <: OSHVerbType end
struct OSHSequentialPerfect <: OSHVerbType end
struct OSHImperfect <: OSHVerbType end
struct OSHSequentialImperfect <: OSHVerbType end
struct OSHJussive <: OSHVerbType end
struct OSHImperative <: OSHVerbType end
struct OSHCohortative <: OSHVerbType end

# Enumeration of persons:
struct OSHFirstPerson <: OSHPerson end
struct OSHSecondPerson <: OSHPerson end
struct OSHThirdPerson <: OSHPerson end

# Enumeration of number:
struct OSHSingular <: OSHNumber end
struct OSHPlural <: OSHNumber end
struct OSHDual <: OSHNumber end

# Enumeration of gender:
struct OSHMasculine <: OSHGender end
struct OSHFeminine <: OSHGender end
struct OSHCommon <: OSHGender end

# Enumeration of values for voice:
struct OSHActive <: OSHVoice end
struct OSHPassive <: OSHVoice end

# Enumeration of noun states:
struct OSHAbsolute <: OSHSubstantiveState end
struct OSHConstruct <: OSHSubstantiveState end

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
