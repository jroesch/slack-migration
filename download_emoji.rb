# Brings in API credentials for making requests.
require_relative "auth"

require 'pry'
require 'hipchat'

client = HipChat::Client.new(HIPCHAT, :api_version => 'v2')

puts client
