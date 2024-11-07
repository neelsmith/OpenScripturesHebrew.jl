# Enumeration of languages:
struct HebrewLanguage <: OSHLanguage end
struct AramaicLanguage <: OSHLanguage end

# Enumeration of parts of speech:
struct PoSAdjective <: OSHPartOfSpeech end
struct PoSConjunction <: OSHPartOfSpeech end
struct PoSAdverb <: OSHPartOfSpeech end
struct PoSNoun <: OSHPartOfSpeech end
struct PoSPronoun <: OSHPartOfSpeech end
struct PoSSuffix <: OSHPartOfSpeech end
struct PoSParticle <: OSHPartOfSpeech end
struct PoSPreposition <: OSHPartOfSpeech end

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

# Enumeration of gender:
struct OSHMasculine <: OSHGender end
struct OSHFeminine <: OSHGender end


# Enumeration of values for voice:
struct OSHActive <: OSHVoice end
struct OSPassive <: OSHVoice end



#=

r	participle active
s	participle passive

a	infinitive absolute
c	infinitive c
=#


# Enumeration of noun states:
struct OSHAbsolute <: OSHNounState end
struct OSHConstruct <: OSHNounState end

