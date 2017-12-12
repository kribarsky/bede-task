require 'httparty'

When 'I execute a POST request to Endpoint4 with invalid ID' do
  @response = HTTParty.post(@base_url + @endpoint4, headers: { authorization: "Bearer #{@access_token}" }, body: { _id: '52719123' })
end

When "I execute a {string} request to Endpoint4" do |method_name|
  @response = HTTParty.public_send method_name.downcase, @base_url + @endpoint4, headers: { authorization: "Bearer d73b7465b58f0c466f721e99a0feb479ef549c60" }
end

Then 'I expect the thing to be deleted' do
  @parsed_response = JSON.parse(@response.body)
  expect(@parsed_response['deleted_thing']).to eq(@id)
end