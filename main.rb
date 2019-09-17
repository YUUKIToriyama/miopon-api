#!/usr/bin/ruby

require 'net/http'

DEV_ID = open("./.developer_id").read
ACCESS_TOKEN = open("./.access_token").read

uri = URI.parse("https://api.iijmio.jp/mobile/d/v2/log/packet/")
req = Net::HTTP::Get.new(uri)

req["X-IIJmio-Developer"] = DEV_ID
req["X-IIJmio-Authorization"] = ACCESS_TOKEN

https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true

response = https.request(req)

puts response.body
