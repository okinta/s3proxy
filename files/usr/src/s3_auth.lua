-- Authenticates with S3 to access private resources

local basexx = require "basexx"
local sha1 = require "sha1"

local string_to_sign = "GET\n\n\n" .. ngx.var.now .. "\n/" .. os.getenv("S3_BUCKET") .. ngx.var.request_uri
local secret = sha1.hmac_binary(os.getenv("AWS_SECRET_KEY"), string_to_sign)
return basexx.to_base64(secret)
