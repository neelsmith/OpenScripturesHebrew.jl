# Enumeration of languages:
struct HebrewLanguage <: OSHLanguage end
struct AramaicLanguage <: OSHLanguage end

# Enumeration of parts of speech:
struct OSHAdjective <: OSHPartOfSpeech end
struct OSHConjunction <: OSHPartOfSpeech end
struct OSHAdverb <: OSHPartOfSpeech end
struct OSHNoun <: OSHPartOfSpeech end
struct OSHPronoun <: OSHPartOfSpeech end
struct OSHSuffix <: OSHPartOfSpeech end
struct  OSHParticle <: OSHPartOfSpeech end
struct OSHPreposition <: OSHPartOfSpeech end
struct OSHVerb <: OSHPartOfSpeech end

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

# Enumeration of tenses:
struct OSHPerfect <: OSHVerbType end
struct OSHSequentialPerfect <: OSHVerbType end
struct OSHImperfect <: OSHVerbType end
struct OSHSequentialImperfect <: OSHVerbType end
struct OSHJussive <: OSHVerbType end
struct OSHImperative <: OSHVerbType end
struct OSHCohortative <: OSHVerbType end

#=

r	participle active
s	participle passive
a	infinitive absolute
c	infinitive c
=#
# Enumeration of noun states:
struct OSHAbsolute <: OSHNounState end
struct OSHConstruct <: OSHNounState end

