"""An infinitive form belongs to a conjugation and has a noun state."""
struct OSHInfinitive <: OSHMorphologicalForm
    state::OSHSubstantiveState
    conjugation::OSHConjugation
end

## ADD SHOW
function show(io::IO, inf::OSHInfinitive)
    print(io, join(["infinitive:", inf.conjugation, inf.state, "state"], " "))
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
    if isnothing(stateval) || isnothing(conj)
        @warn("Invalid code for constructing infinitive: $(code).")
        nothing
    else
        OSHInfinitive(stateval, conj)
    end

end


"""Find noun state for an infinitive form.
$(SIGNATURES)
"""
function substantive_state(inf::OSHInfinitive)
    inf.state
end


"""Find conjugation for an infinitive form.
$(SIGNATURES)
"""
function conjugation(inf::OSHInfinitive)
    inf.conjugation
end

function speechpart(inf::OSHInfinitive)
    PoSInfinitive()
end