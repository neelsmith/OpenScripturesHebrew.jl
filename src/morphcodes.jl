
"""Find Hebrew conjugation object for a character code.
$(SIGNATURES)
"""
function conjugation(lang::HebrewLanguage, code::Char)
    if code == 'q'
        OSHQal()        
    elseif code == 'h'
        OSHHiphil()
    elseif code == 'p'
        OSHPiel()  
    elseif code == 'N'
        OSHNiphal()  
    elseif code == 'P'
        OSHPual()        
    elseif code == 'H'
        OSHHophal()    
    elseif code == 't'
        OSHTiphil()  
    elseif code == 'Q'
        OSHQalPassive()  
    elseif code == 'v'
        OSHHishtaphel() 
    elseif code == 'f'
        OSHHithpalpel() 
    elseif code == 'o'
        OSHPolel()  
    elseif code == 'r'
        OSHHithpolel()         
    elseif code == 'l'
        OSHPilpel()        
    elseif code == 'k'
        OSHPalel()  
    elseif code == 'm'
        OSHPoel()
    elseif code == 'u'
        OSHHothpaal()
    elseif code == 'D'
        OSHNithpael()
    elseif code == 'M'
        OSHPoal()
    elseif code == 'L'
        OSHPolpal()
    elseif code == 'K'
        OSHPulal()
    elseif code == 'O'
        OSHPolal()
    elseif code == 'c'
        OSHTiphil()
    elseif code == 'z'
        OSHHithpoel()
    elseif code == 'j'
        OSHPealal()
    elseif code == 'i'
        OSHPilel()

    elseif code == 'e' || code == 'a'
        @warn("Data error in morph. code $(code). (Invalid value for conjugation.)")
        nothing
    else
        @error("Unrecognized value for conjugation $(code)")
    end
end

"""Find conjugation for a morphological code.
$(SIGNATURES)
"""
function conjugation(code::AbstractString)::Union{OSHConjugation, Nothing}
    conjugation(speechpart(code), language(code), code)
end



"""Find conjugation for a Hebrew verb code.
$(SIGNATURES)
"""
function conjugation(finite::PoSFiniteVerb, lang::HebrewLanguage, codestring::AbstractString)::Union{OSHConjugation, Nothing}
    if isempty(codestring) || length(codestring) < 3
        @error("Invalid argument for conjugation $(codestring)")
        nothing
    else
        conjugation(lang, codestring[3])
    end
end


"""Find conjugation for a Hebrew participle code.
$(SIGNATURES)
"""
function conjugation(finite::PoSParticiple, lang::HebrewLanguage, codestring::AbstractString)::Union{OSHConjugation, Nothing}
    if isempty(codestring) || length(codestring) < 3
        @error("Invalid argument for conjugation $(codestring)")
        nothing
    else
        conjugation(lang, codestring[3])
    end
end


"""Find Hebrew verb type ("tense") for a morphological code.
$(SIGNATURES)
"""
function verbtype(lang::HebrewLanguage, codestring)::Union{OSHVerbType, Nothing}
    if isempty(codestring) || length(codestring) < 4
        @error("Invalid argument for verbtype $(codestring)")
        nothing
    elseif codestring[4] == 'p'
        OSHPerfect() 
    elseif codestring[4] == 'q'
        OSHSequentialPerfect()         
    elseif codestring[4] == 'i'
        OSHImperfect()         
    elseif codestring[4] == 'w'
        OSHSequentialImperfect() 

    elseif codestring[4] == 'j'
        OSHJussive()
    elseif codestring[4] == 'v'
        OSHImperative()
    elseif codestring[4] == 'h'
        OSHCohortative()                 

    else
        @error("Unrecognized code for verb type: $(codestring[4]) in $(codestring)")
        nothing
    end
end


"""Find verb type for a morphological code.
$(SIGNATURES)
"""
function verbtype(codestring)::Union{OSHVerbType, Nothing}
    verbtype(language(codestring), codestring)
end



## Person

"""Find OSHPerson for a character code.
$(SIGNATURES)
"""
function person(code::Char)::Union{OSHPerson, Nothing}
    if code == '1'
        OSHFirstPerson()
    elseif code == '2'
        OSHSecondPerson()

    elseif code == '3'
        OSHThirdPerson()
    else
        @error("Invalid value for person: $(code)")
        nothing
    end
end

"""
$(SIGNATURES)
"""
function person(code::AbstractString)::Union{OSHPerson, Nothing}
    person(speechpart(code), code)
end

"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function person(speechpart::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHPerson, Nothing}
    @error("No implementation of person function for $(typeof(speechpart))")
    nothing
end

"""Find OSHPerson for a finite verb code.
$(SIGNATURES)
"""
function person(finite::PoSFiniteVerb, codestring::AbstractString)::Union{OSHPerson, Nothing}
    person(codestring[5])
end


"""Find OSHPerson for a suffix.
$(SIGNATURES)
"""
function person(finite::PoSSuffix, codestring::AbstractString)::Union{OSHPerson, Nothing}
    person(codestring[4])
end



### Number

"""Find OSHNumber for a character code.
$(SIGNATURES)
"""
function number(code::Char)::Union{OSHNumber, Nothing}
    if code == 's'
        OSHSingular()
    elseif code == 'p'
        OSHPlural()
    elseif code == 'd'
        OSHDual()
    else
        @error("Invalid value for number $(code)")
        nothing
    end
end

"""Find OSHNumber for a morphological code.
$(SIGNATURES)
"""
function number(code::AbstractString)::Union{OSHNumber, Nothing}
    number(speechpart(code), code)
end

"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function number(speechpartvalue::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHNumber, Nothing}
    @error("No implementation of number function for $(typeof(speechpartvalue))")
    nothing
end

"""Find OSHNumber for a finite verb code.
$(SIGNATURES)
"""
function number(finite::PoSFiniteVerb, codestring::AbstractString)::Union{OSHNumber, Nothing}
    number(codestring[7])
end

"""Find OSHNumber for a participle code.
$(SIGNATURES)
"""
function number(finite::PoSParticiple, codestring::AbstractString)::Union{OSHNumber, Nothing}
    number(codestring[6])
end

"""Find OSHNumber for a noun.
$(SIGNATURES)
"""
function number(finite::PoSNoun, codestring::AbstractString)::Union{OSHNumber, Nothing}
    number(codestring[5])
end

"""Find OSHNumber for an adjective.
$(SIGNATURES)
"""
function number(finite::PoSAdjective, codestring::AbstractString)::Union{OSHNumber, Nothing}
    number(codestring[5])
end



"""Find OSHNumber for a suffixed object.
$(SIGNATURES)
"""
function number(finite::PoSSuffix, codestring::AbstractString)::Union{OSHNumber, Nothing}
    number(codestring[6])
end



### Gender

"""Find OSHGender for a character code.
$(SIGNATURES)
"""
function gender(code::Char)::Union{OSHGender, Nothing}
    if code == 'c' || code == 'b'
        OSHCommon()
    elseif code == 'f'
        OSHFeminine()
    elseif code == 'm'
        OSHMasculine()
    else
        @error("Invalid value for gender $(code)")
        nothing
    end
end


"""Find OSHGender for a morphological code.
$(SIGNATURES)
"""
function gender(code::AbstractString)::Union{OSHGender, Nothing}
    gender(speechpart(code), code)
end


"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function gender(speechpartvalue::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHGender, Nothing}
    @error("No implementation of gender function for $(typeof(speechpartvalue))")
    nothing
end



"""Find OSHGender for a finite verb code.
$(SIGNATURES)
"""
function gender(finite::PoSFiniteVerb, codestring::AbstractString)::Union{OSHGender, Nothing}
    gender(codestring[6])
end


"""Find OSHGender for a participle verb code.
$(SIGNATURES)
"""
function gender(finite::PoSParticiple, codestring::AbstractString)::Union{OSHGender, Nothing}
    gender(codestring[5])
end


"""Find OSHGender for a noun code.
$(SIGNATURES)
"""
function gender(finite::PoSNoun, codestring::AbstractString)::Union{OSHGender, Nothing}
    gender(codestring[4])
end


"""Find OSHGender for an adjective code.
$(SIGNATURES)
"""
function gender(finite::PoSAdjective, codestring::AbstractString)::Union{OSHGender, Nothing}
    gender(codestring[4])
end



"""Find OSHGender for a suffixed object.
$(SIGNATURES)
"""
function gender(finite::PoSSuffix, codestring::AbstractString)::Union{OSHGender, Nothing}
    gender(codestring[5])
end


## Voice

"""Find OSHVoice for a character code.
$(SIGNATURES)
"""
function voice(code::Char)::Union{OSHVoice, Nothing}
    if code == 'a'
        OSHActive()
    elseif code == 'p'
        OSHPassive()
    
    else
        @error("Invalid value for voice $(code)")
        nothing
    end
end


"""Find OSHVoice for a morphological code.
$(SIGNATURES)
"""
function voice(code::AbstractString)::Union{OSHVoice, Nothing}
    voice(speechpart(code), code)
end

"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function voice(speechpartvalue::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHVoice, Nothing}
    @error("No implementation of gender function for $(typeof(speechpartvalue))")
    nothing
end


"""Find OSHVoice for a participle code.
$(SIGNATURES)
"""
function voice(finite::PoSParticiple, codestring::AbstractString)::Union{OSHVoice, Nothing}
    if isempty(codestring) || length(codestring) < 4
        @error("Invalid participle code $(codestring)")
        nothing

    elseif codestring[4] == 'r' 
        OSHActive()
    elseif codestring[4] == 's' 
        OSHPassive()
    else
        @error("Invalid character for participle voice in $(codestring)")
        nothing
    end
end


## Noun types

function nountype(ch::Char)::Union{OSHNounType, Nothing}
    if ch == 'g'
        OSHGentilic()
    elseif ch == 'c'
        OSHCommonNoun()
    elseif ch == 'p'
        OSHProperName()
    else
        @error("Invalid code for nount type $(ch)")
        nothing
    end
end



## Substantive state

function substantive_state(ch::Char)::Union{OSHSubstantiveState, Nothing}
    if ch == 'a'
        OSHAbsolute()
    elseif ch == 'c'
        OSHConstruct()

    else
        @error("Invalid code for substantive state $(ch)")
        nothing
    end
end



# Adjective type

function adjectivetype(ch::Char)::Union{OSHAdjectiveType, Nothing}
    if ch == 'g'
        OSHGentilicAdjective()
    elseif ch == 'a'
        OSHSimpleAdjective()
    elseif ch == 'c'
        OSHCardinalNumber()
    elseif ch == 'o'
        OSHOrdinalNumber()
    else
        @error("Invalid code for adjective type $(ch)")
        nothing
    end
end