Feature: Endpoint2 - thing/change - accepts only POST requests and is used to change things belonging to a user

  Background: Prerequisites
      Given I have Base URL, Endpoints and access_token

  Scenario: Different methods
    When I execute a "GET" request to "Endpoint2"
        Then I expect status code 400
      When I execute a "PUT" request to "Endpoint2"
        Then I expect status code 400
      When I execute a "DELETE" request to "Endpoint2"
        Then I expect status code 400

  Scenario: Change an already existing thing of the authenticated user
      Given I execute a "POST" request to "Endpoint1"
      And I expect to get thing ID
        When I execute a "POST" request to "Endpoint2"
        Then I expect the title to be changed

  Scenario: Missing title id
      When I execute a POST request with missing ID
      Then I expect status code 400

  Scenario: Using an expired token
      When I execute a "GET" request to Endpoint2
        Then I expect status code 401
      When I execute a "POST" request to Endpoint2
        Then I expect status code 401
      When I execute a "PUT" request to Endpoint2
        Then I expect status code 401
      When I execute a "DELETE" request to Endpoint2
        Then I expect status code 401