
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
    else
        @error("Unrecognized value for conjugation $(codestring)")
    end
end

"""Find conjugation for a Hebrew verb code.
$(SIGNATURES)
"""
function conjugation(lang::HebrewLanguage, codestring::AbstractString)::Union{OSHConjugation, Nothing}
    if isempty(codestring) || length(codestring) < 3
        @error("Invalid argument for conjugation $(codestring)")
        nothing
    else
        conjugation(lang, codestring[3])
    end
end

"""Find conjugation for a morphological code.
$(SIGNATURES)
"""
function conjugation(code::AbstractString)::Union{OSHConjugation, Nothing}
    conjugation(language(code), code)
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
    person(pos(code), code)
end

"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function person(pos::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHPerson, Nothing}
    @error("No implementation of person function for $(typeof(pos))")
    nothing
end

"""Find OSHPerson for a finite verb code.
$(SIGNATURES)
"""
function person(finite::PoSFiniteVerb, codestring::AbstractString)::Union{OSHPerson, Nothing}
    person(codestring[5])
end


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
    number(pos(code), code)
end

"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function number(posvalue::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHNumber, Nothing}
    @error("No implementation of number function for $(typeof(posvalue))")
    nothing
end

"""Find OSHNumber for a finite verb code.
$(SIGNATURES)
"""
function number(finite::PoSFiniteVerb, codestring::AbstractString)::Union{OSHNumber, Nothing}
    number(codestring[7])
end


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
    gender(pos(code), code)
end


"""Catch-all method for multiple dispatch.
$(SIGNATURES)
"""
function gender(posvalue::OSHPartOfSpeech, codestring::AbstractString)::Union{OSHGender, Nothing}
    @error("No implementation of gender function for $(typeof(posvalue))")
    nothing
end



"""Find OSHGender for a finite verb code.
$(SIGNATURES)
"""
function gender(finite::PoSFiniteVerb, codestring::AbstractString)::Union{OSHGender, Nothing}
    gender(codestring[6])
end