require 'httparty'
@id = nil
@title = nil

Given 'I expect to get thing ID' do
  @parsed_response = JSON.parse(@response.body)
  @id = @parsed_response['_id']
  @title = @parsed_response['title']
  expect(@id).not_to be(nil)
end

When "I execute a {string} request to Endpoint1" do |method_name|
  @response = HTTParty.public_send method_name.downcase, @base_url + @endpoint1, headers: { authorization: "Bearer d73b7465b58f0c466f721e99a0feb479ef549c60" }
end

When 'I execute a POST request to Endpoint1 without parameter title' do
  @response = HTTParty.post(@base_url + @endpoint1, headers: { authorization: "Bearer #{@access_token}" })
end
