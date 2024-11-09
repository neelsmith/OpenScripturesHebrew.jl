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


function oshverse(book::AbstractString, ref::AbstractString, words::Vector)
    urn = "urn:cts:compnov:bible.$(bookids[book]).osh:$(ref)"
    filter(w -> w.urn == urn, words)
end