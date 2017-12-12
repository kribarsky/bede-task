require 'httparty'
require 'rspec'

Given 'I have Base URL, Endpoints and access_token' do
  @base_url = 'https://api.thinkery.me/v1/'
  @endpoint1 = 'thing/add'
  @endpoint2 = 'thing/change'
  @endpoint3 = 'things/get'
  @endpoint4 = 'thing/delete'
  @response = nil
  @access_token ||= File.read('features/access_token').strip
end

When "I execute a {string} request to {string}" do |method, endpoint|
  @response =  case method
              when 'GET'
                case endpoint
                when 'Endpoint1'
                  HTTParty.get(@base_url + @endpoint1, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint2'
                  HTTParty.get(@base_url + @endpoint2, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint3'
                  HTTParty.get(@base_url + @endpoint3, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint4'
                  HTTParty.get(@base_url + @endpoint4, headers: { authorization: "Bearer #{@access_token}" })
                end
              when 'POST'
                case endpoint
                when 'Endpoint1'
                  HTTParty.post(@base_url + @endpoint1, headers: { authorization: "Bearer #{@access_token}" }, body: { title: 'new title' })
                when 'Endpoint2'
                  HTTParty.post(@base_url + @endpoint2, headers: { authorization: "Bearer #{@access_token}" }, body: { _id: @id, title: 'changed by user' })
                when 'Endpoint3'
                  HTTParty.post(@base_url + @endpoint3, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint4'
                  HTTParty.post(@base_url + @endpoint4, headers: { authorization: "Bearer #{@access_token}" }, body: { _id: @id })
                end
              when 'PUT'
                case endpoint
                when 'Endpoint1'
                  HTTParty.put(@base_url + @endpoint1, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint2'
                  HTTParty.put(@base_url + @endpoint2, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint3'
                  HTTParty.put(@base_url + @endpoint3, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint4'
                  HTTParty.put(@base_url + @endpoint4, headers: { authorization: "Bearer #{@access_token}" })
                end
              when 'DELETE'
                case endpoint
                when 'Endpoint1'
                  HTTParty.delete(@base_url + @endpoint1, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint2'
                  HTTParty.delete(@base_url + @endpoint2, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint3'
                  HTTParty.delete(@base_url + @endpoint3, headers: { authorization: "Bearer #{@access_token}" })
                when 'Endpoint4'
                  HTTParty.delete(@base_url + @endpoint4, headers: { authorization: "Bearer #{@access_token}" })
                end
              end
end

Then "I expect status code {int}" do |int|
  case int
  when 200
    expect(@response.code).to eq(200)
  when 400
    expect(@response.code).to eq(400)
  when 401
    expect(@response.code).to eq(401)
  end
end
