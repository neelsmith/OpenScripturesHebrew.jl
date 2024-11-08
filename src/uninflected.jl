struct OSHConjunction <: OSHMorphologicalForm end
function conjunction(code::AbstractString)
    OSHConjunction( )
end

struct OSHPreposition <: OSHMorphologicalForm end
function preposition(code::AbstractString)
    OSHPreposition( )
end


struct OSHAdverb <: OSHMorphologicalForm end
function adverb(code::AbstractString)
    OSHAdverb( )
end


struct OSHParticle <: OSHMorphologicalForm end
function particle(code::AbstractString)
    OSHParticle( )
end