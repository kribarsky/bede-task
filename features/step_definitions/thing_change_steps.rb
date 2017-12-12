require 'httparty'
require 'rspec'

When 'I execute a POST request with missing ID' do
  @response = HTTParty.post(@base_url + @endpoint2, headers: { authorization: "Bearer #{@access_token}" }, body: { title: 'changed by user' })
end

When "I execute a {string} request to Endpoint2" do |method_name|
  @response = HTTParty.public_send method_name.downcase, @base_url + @endpoint2, headers: { authorization: "Bearer d73b7465b58f0c466f721e99a0feb479ef549c60" }
end

Then "I expect the title to be changed" do
  @parsed_response = JSON.parse(@response.body)
  @new_title = @parsed_response['title']
  @old_title = @title
  expect(@new_title).not_to eq(@old_title)
end
