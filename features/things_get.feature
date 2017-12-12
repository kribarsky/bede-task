Feature: Endpoint3 - things/get - accepts only GET requests and is used to retrieve a user's list of things

  Background: Prerequisites
    Given I have Base URL, Endpoints and access_token

  Scenario: Get all things of the authenticated user
    When I execute a "GET" request to "Endpoint3"
      Then I expect status code 200
      And I expect a list of the user's things

  Scenario: Different methods
# All tests in this scenario fail, because the endpoint accepts all types of requests and it shouldn't
    When I execute a "POST" request to "Endpoint3"
      Then I expect status code 400
    When I execute a "PUT" request to "Endpoint3"
      Then I expect status code 400
    When I execute a "DELETE" request to "Endpoint3"
      Then I expect status code 400

  Scenario: Using an expired token
    When I execute a "GET" request to Endpoint3
      Then I expect status code 401
    When I execute a "POST" request to Endpoint3
      Then I expect status code 401
    When I execute a "PUT" request to Endpoint3
      Then I expect status code 401
    When I execute a "DELETE" request to Endpoint3
      Then I expect status code 401
