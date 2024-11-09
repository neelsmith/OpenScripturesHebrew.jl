struct OSHSuffix <: OSHMorphologicalForm
    person::Union{OSHPerson, Nothing}
    number::Union{OSHNumber, Nothing}
    gender::Union{OSHGender, Nothing}
end

function show(io::IO, sfx::OSHSuffix)
    print(io, join(["suffix:", sfx.person, sfx.number, sfx.gender], " "))
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

function speechpart(sfx::OSHSuffix)
    PoSSuffix()
end