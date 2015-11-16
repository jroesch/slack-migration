# Brings in API credentials for making requests.
require_relative "auth"

require 'pry'
require 'faraday'
require 'json'

conn = Faraday.new(url: 'http://api.hipchat.com')
response = conn.get "/v2/emoticon?auth_token=#{HIPCHAT}"
json = JSON::parse(response.body)

emoticons = json['items'].map do |item|
  { name: item["shortcut"], src: item["url"] }
end

begin
  # Dir.mkdir('emoticons')
  # # If the directory exists the exception will be thrown,
  # # and we won't re-download the emojis
  # Dir.chdir("emoticons") do
  #   cwd = Dir.pwd
  #   emoticons.each do |emoticon|
  #     file_name = emoticon[:url].split("/").last
  #     ext = file_name.split(".").last
  #     image_bytes = Faraday.get(emoticon[:url]).body
  #     file = open(cwd + '/' + emoticon[:name] + '.' + ext, 'wb')
  #     file.write(image_bytes)
  #     file.close
  #   end
  # end
rescue Errno::EEXIST
end

emojipack = {
  title: 'uw-cse'
  emojis: emoticons.map
}

binding.pry
