struct OSHInfinitive <: OSHMorphologicalForm
    state#::OSHNounState
    conjugation#::OSHConjugation
end

function infinitivestate(code::AbstractString)
    if length(code) < 4
        @error("Invalid code $(code)")
    else
        lang = language(code)
        conj = conjugation(lang, code[3])
        stateval = nothing
        if code[4] == 'a'
            stateval = OSHAbsolute
        elseif code[4] == 'c'
            stateval = OSHConstruct
        end
    end
    OSHInfinitive(stateval, conj)

end
