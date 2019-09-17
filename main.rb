#!/usr/bin/ruby

require 'net/http'
require 'json'

uri = URI.parse("https://api.iijmio.jp/mobile/d/v2/log/packet/")
req = Net::HTTP::Get.new(uri)

req["X-IIJmio-Developer"] = open("./.developer_id").read
req["X-IIJmio-Authorization"] = open("./.access_token").read

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true

response = https.request(req)

json = JSON.parse(response.body)
puts JSON.pretty_generate(json)
