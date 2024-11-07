
const OSIS = "http://www.bibletechnologies.net/2003/OSIS/namespace"

"""Get value of attribute. Returns nothing if no such attribute.
"""
function attributevalue(n::EzXML.Node, attrname)
    matches = filter(attributes(n)) do attr
        nodename(attr) == attrname
    end
    isempty(matches) ? nothing : nodecontent(matches[1])
end

function morphcode(n::EzXML.Node)
    attributevalue(n,"morph")
end

function parseword(n::EzXML.Node)
end