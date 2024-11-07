"""Participles belong to a conjugation, and have
voice, gender, number and substantive state.
"""
struct OSHParticiple <: OSHVerb
    conjugation::OSHConjugation
    voice::OSHVoice
    gender::OSHGender
    number::OSHNumber
    state::OSHSubstantiveState

end

"""Construct a participle object from a morphological code.
$(SIGNATURES)
"""
function participle(code)
    thestate = nothing
    if code[7] == 'a'
        thestate = OSHAbsolute()
    elseif code[7]  == 'c'
        thestate = OSHConstruct()
    end
    if isnothing(thestate)
        @error("Invalid code for substantive state of participle: $(code)")
        nothing
    else
        OSHParticiple(
            conjugation(code),
            voice(code),
            gender(code),
            number(code),
            thestate
        )
    end
end

"""Find conjugation for a participle form.
$(SIGNATURES)
"""
function conjugation(p::OSHParticiple)
    p.conjugation
end


"""Find voice for a participle form.
$(SIGNATURES)
"""
function voice(p::OSHParticiple)
    p.voice
end

"""Find gender for a participle form.
$(SIGNATURES)
"""
function gender(p::OSHParticiple)
    p.gender
end


"""Find number for a participle form.
$(SIGNATURES)
"""
function number(p::OSHParticiple)
    p.number
end


"""Find substantive state for a participle form.
$(SIGNATURES)
"""
function substantive_state(p::OSHParticiple)
    p.state
end