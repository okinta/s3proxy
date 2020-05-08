local zlib = require "zlib"

function decompress ()
    ngx.arg[1] = zlib.inflate()(ngx.arg[1])
end

if not pcall(decompress) then
    ngx.arg[1] = ngx.arg[1]
end
