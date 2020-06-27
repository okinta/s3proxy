-- Authenticates with S3 to access private resources

local basexx = require "basexx"
local sha1 = require "sha1"

local now = ngx.cookie_time(ngx.time())
local string_to_sign = "GET\n\n\n" .. now .. "\n/" .. os.getenv("S3_BUCKET") .. ngx.var.request_uri
local secret = sha1.hmac(os.getenv("AWS_SECRET_KEY"), string_to_sign)
local signature = basexx.to_base64(secret)
local authorization = "AWS " .. os.getenv("AWS_ACCESS_KEY") .. ":" .. signature

ngx.req.set_header("Host", os.getenv("S3_BUCKET_URL"))
ngx.req.set_header("Date", now)
ngx.req.set_header("Authorization", authorization)
