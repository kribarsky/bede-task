Feature: Endpoint 4 - thing/delete - accepts only POST requests and is used to remove things from user

  Background: Prerequisites
    Given I have Base URL, Endpoints and access_token

  Scenario: Delete a thing of the authenticated user
    Given I execute a "POST" request to "Endpoint1"
    And I expect to get thing ID
      When I execute a "POST" request to "Endpoint4"
      Then I expect the thing to be deleted

  Scenario: Different methods
    When I execute a "GET" request to "Endpoint4"
      Then I expect status code 400
    When I execute a "PUT" request to "Endpoint4"
      Then I expect status code 400
    When I execute a "DELETE" request to "Endpoint4"
      Then I expect status code 400

  Scenario: Invalid ID
    When I execute a POST request to Endpoint4 with invalid ID
    Then I expect status code 400

  Scenario: Using an expired token
    When I execute a "GET" request to Endpoint4
      Then I expect status code 401
    When I execute a "POST" request to Endpoint4
      Then I expect status code 401
    When I execute a "PUT" request to Endpoint4
      Then I expect status code 401
    When I execute a "DELETE" request to Endpoint4
      Then I expect status code 401
