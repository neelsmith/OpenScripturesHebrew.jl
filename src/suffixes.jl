struct OSHSuffix <: OSHMorphologicalForm
    person::Union{OSHPerson, Nothing}
    number::Union{OSHNumber, Nothing}
    gender::Union{OSHGender, Nothing}
end

function suffix(code::AbstractString)

    if length(code) == 3
        OSHSuffix(nothing, nothing, nothing)
    else
        OSHSuffix(
            person(code),
            number(code),
            gender(code)
        )
    end
end