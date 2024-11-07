struct OSHFiniteVerb <: OSHVerb
    conjugation::OSHConjugation
    verbtype::OSHVerbType
    person::OSHPerson
    number::OSHNumber
    gender::OSHGender
end
