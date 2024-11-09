struct OSHConjunction <: OSHMorphologicalForm end
function conjunction(code::AbstractString)
    OSHConjunction( )
end
function show(io::IO, pron::OSHConjunction)
    print(io, "conjunction")
end

struct OSHPreposition <: OSHMorphologicalForm end
function preposition(code::AbstractString)
    OSHPreposition( )
end
function show(io::IO, pron::OSHPreposition)
    print(io, "preposition")
end


struct OSHAdverb <: OSHMorphologicalForm end
function adverb(code::AbstractString)
    OSHAdverb( )
end
function show(io::IO, pron::OSHAdverb)
    print(io, "adverb")
end


struct OSHParticle <: OSHMorphologicalForm end
function particle(code::AbstractString)
    OSHParticle( )
end
function show(io::IO, pron::OSHParticle)
    print(io, "particle")
end