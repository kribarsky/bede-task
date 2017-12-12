Feature: Acquire new access token

  Background: Prerequisites
    Given I have client id, client secret, username and password

  Scenario: Receive token
    When I execute POST request to token endpoint
    Then I expect to receive new access token