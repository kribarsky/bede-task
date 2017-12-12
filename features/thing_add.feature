Feature: Endpoint1 - thing/add - accepts only POST requests and is used to add things to an existing user

  Background: Prerequisites
    Given I have Base URL, Endpoints and access_token

  Scenario: Using an expired token
    When I execute a "GET" request to Endpoint1
      Then I expect status code 401
    When I execute a "POST" request to Endpoint1
      Then I expect status code 401
    When I execute a "PUT" request to Endpoint1
      Then I expect status code 401
    When I execute a "DELETE" request to Endpoint1
      Then I expect status code 401

  Scenario: Different methods
    When I execute a "GET" request to "Endpoint1"
      Then I expect status code 400
    When I execute a "PUT" request to "Endpoint1"
      Then I expect status code 400
    When I execute a "DELETE" request to "Endpoint1"
      Then I expect status code 400

  Scenario: Add a new thing for the authenticated user
    When I execute a "POST" request to "Endpoint1"
      Then I expect status code 200
      And I expect to get thing ID

  Scenario: Missing title
    When I execute a POST request to Endpoint1 without parameter title
      Then I expect status code 400