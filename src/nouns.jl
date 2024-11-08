"""The OSH model a noun form has gender, number, substantive state and a noun type."""
struct OSHNoun <: OSHMorphologicalForm
    gender::Union{Nothing,OSHGender}
    number::Union{OSHNumber, Nothing}
    state::Union{OSHSubstantiveState, Nothing}
    type::OSHNounType
end


"""Construct a noun from morphological code.
$(SIGNATURES)
"""
function noun(code::AbstractString)
    if length(code) == 3 && nountype(code[3]) isa OSHProperName
        OSHNoun(nothing, nothing, nothing, OSHProperName())
        
    elseif length(code) < 6
        @error("Invalid code for noun $(code)")

    else

        thestate = substantive_state(code[6])
        thetype = nountype(code[3])

        if isnothing(thestate) || isnothing(thetype)
            @error("Invalid noun code $(code)")
            nothing
        else
            OSHNoun(
            gender(code),
            number(code),
            thestate,
            thetype
            )
        end
    end
end


"""Find the gender for a noun form.
$(SIGNATURES)
"""
function gender(n::OSHNoun)
    n.gender
end

"""Find the number for a noun form.
$(SIGNATURES)
"""
function number(n::OSHNoun)
    n.number
end


"""Find the substantive state for a noun form.
$(SIGNATURES)
"""
function substantive_state(n::OSHNoun)
    n.state
end

"""Find the noun type for a noun form.
$(SIGNATURES)
"""
function nountype(n::OSHNoun)
    n.type
end