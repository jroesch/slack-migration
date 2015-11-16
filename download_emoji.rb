# Brings in API credentials for making requests.
require_relative "auth"

require 'pry'
require 'faraday'
require 'json'

conn = Faraday.new(url: 'http://api.hipchat.com')
response = conn.get "/v2/emoticon?auth_token=#{HIPCHAT}"
json = JSON::parse(response.body)

emojis = json['items'].map do |item|
  { "name" => item["shortcut"],
    "src" => item["url"].gsub('.png', '@4x.png')
                        .gsub('.jpg', '@4x.jpg')
                        .gsub('.gif', '@4x.gif')
  }
end

emojipack = {
  'title' => 'uw-cse',
  'emojis' => emojis
}

f = open('uw-cse.yaml', 'w')
f.write(emojipack.to_yaml())

puts "Complete"
