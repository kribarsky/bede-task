require 'httparty'
require 'rspec'

Given 'I have client id, client secret, username and password' do
  @client_id = 'ypKQ0ZkN0b'
  @client_secret = 'rUExIZY1boulzx4Pyeh42fmHrePMOjBi'
  @grant_type = 'password'
  @username = 'kiril1'
  @password = 'ribarsky'
  @response = nil
end

When 'I execute POST request to token endpoint' do
  @response = HTTParty.post("https://api.thinkery.me/v1/token", body: {
   client_id: @client_id,
   client_secret: @client_secret,
   grant_type: @grant_type,
   username: @username,
   password: @password })
end

Then 'I expect to receive new access token' do
  @parsed_response = JSON.parse(@response.body)
  expect(@parsed_response['access_token']).not_to be(nil)
  @new_token = @parsed_response['access_token']
end