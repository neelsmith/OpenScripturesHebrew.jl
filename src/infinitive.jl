struct OSHInfinitive <: OSHMorphologicalForm
    state::OSHNounState
    conjugation::OSHConjugation
end

"""Instantiate an infinitive from a morphological code string.
$(SIGNATURES)
"""
function infinitive(code::AbstractString)
    if length(code) < 4
        @error("Invalid code $(code)")
    else
        lang = language(code)
        conj = conjugation(lang, code[3])
        stateval = nothing
        if code[4] == 'a'
            stateval = OSHAbsolute()
        elseif code[4] == 'c'
            stateval = OSHConstruct()
        end
    end
    OSHInfinitive(stateval, conj)

end

function nounstate(inf::OSHInfinitive)
    inf.state
end

function conjugation(inf::OSHInfinitive)
    inf.conjugation
end