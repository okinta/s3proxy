local key = os.getenv("AUTH_KEY")

-- If a key hasn't been set, allow all requests
if key == nil then
    return
end

-- Allow requests that send the key
if ngx.req.get_headers()["Authorization"] == key then
    return
end

-- Deny all other requests
ngx.exit(ngx.HTTP_UNAUTHORIZED)
