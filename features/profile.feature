Feature: Configuration files
  dotfile populates/depopulates files based on a configuration profile.

  Background:
    Given a mocked home directory

  Scenario: Invalid JSON file
    Given a file named ".dotfiles/profiles/testing.json" with:
    """
    {"totally an invalid JSON string"}}
    """
    When I run `doting install testing`
    Then the output should contain "CONFIGURATION FILE ERROR:"
    And the exit status should not be 0
