require 'httparty'
require 'rspec'

When "I execute a {string} request to Endpoint3" do |method_name|
  @response = HTTParty.public_send method_name.downcase, @base_url + @endpoint3, headers: { authorization: "Bearer d73b7465b58f0c466f721e99a0feb479ef549c60" }
end

Then "I expect a list of the user's things" do
  @parsed_list_response = JSON.parse(@response.body)
  expect(@parsed_list_response).not_to be(nil)
end