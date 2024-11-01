-- include-files.lua
function RawBlock(el)
    local inc_file = el.text:match("{{include%s+'(.-)'}}")
    if inc_file then
        local file = io.open(inc_file, "r")
        if file then
            local content = file:read("*all")
            file:close()
            return pandoc.RawBlock('markdown', content)
        else
            io.stderr:write("Cannot open file: " .. inc_file .. "\n")
        end
    end
end
