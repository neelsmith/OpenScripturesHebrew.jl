"""True if tuple is a Hebrew word.
$(SIGNATURES)
"""
function ishebrew(tpl::NamedTuple)::Bool
    language(tpl.code) isa HebrewLanguage
end

"""True if morphological code is a Hebrew word.
$(SIGNATURES)
"""
function ishebrew(code::AbstractString)::Bool
    language(code) isa HebrewLanguage
end
