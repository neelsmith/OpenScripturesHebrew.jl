struct OSHSuffix <: OSHMorphologicalForm
    person::OSHPerson
    number::OSHNumber
    gender::OSHGender
end

function suffix(code::AbstractString)
    OSHSuffix(
        person(code),
        number(code),
        gender(code)
    )
end