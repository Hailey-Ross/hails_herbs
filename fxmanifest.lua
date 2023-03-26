name "hails_herbs"
author "Hailey-Ross"
description "Herb Picking Resource"
url "https://github.com/Hailey-Ross/hails_herbs"

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_script 'client/client.lua'
shared_script 'config.lua'
server_script 'server/server.lua'

version '0.1'
vorp_checker 'yes'
vorp_name '^4Resource version Check^3'
vorp_github 'https://github.com/Hailey-Ross/hails_herbs'