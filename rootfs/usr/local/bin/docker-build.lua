#!/usr/bin/lua
local core = require("docker-core")

local function main()
  local version = "4.8.5"
  -- local url = "https://files.phpmyadmin.net/phpMyAdmin/4.8.5/phpMyAdmin-4.8.5-all-languages.zip"
  local url =
    string.format("https://files.phpmyadmin.net/phpMyAdmin/%s/phpMyAdmin-%s-all-languages.zip", version, version)
  local file = "source.zip"
  local target = "/tmp/phpMyAdmin/"

  -- core.run("apk add --no-cache php7-session php7-curl php7-mongodb $(apk search --no-cache -xq php7-pdo*)")
  core.run("wget -qO %s %s", file, url)
  -- core.run("tar xzf %s --strip-components=1 'phpMyAdmin-%s-all-languages/' ", file, version)
  core.run("mkdir -p %s", target)
  core.run("unzip %s -d %s", file, target)
  core.run("mv %s/phpMyAdmin-%s-all-languages/* .", target, version)
  core.run("rm -f %s", file)
  core.run("rm -rf %s", target)
end

main()
