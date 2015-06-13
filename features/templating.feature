Feature: Template dotfiles
  As a end user, I should be able to provide a set of keys and values
  for which, using Embedded Ruby, my files can be templated to allow
  for value substitution based on profiles.

  Background:
    Given a mocked home directory

  Scenario: Basic value substitution
    Given a file named ".dotfiles/profiles/testing.json" with:
    """
    {"symlinks": {"src/test.ini": ".test.ini"}, "context": {"name": "value"}}
    """
    And a file named ".dotfiles/src/test.ini" with:
    """
    [section]
    name = <%= name %>
    """
    When I run `doting install testing`
    Then the file "~/.test.ini" should contain exactly:
    """
    [section]
    name = value
    """
