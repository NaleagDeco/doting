Feature: Uninstall dotfiles

  There should be a command to uninstall dotfiles installed by doting
  Running the uninstallation multiple times shouldn't break anything
  Uninstallation shouldn't remove anything not installed by the program

  Background:
    Given a mocked home directory
    And a directory named ".dotfiles/profiles"
    And a directory named ".dotfiles/src"

    And a file named ".dotfiles/profiles/testing.json" with:
    """
    {"symlinks": {"testrc":".testrc"}}
    """
    And an empty file named ".dotfiles/src/testrc"

  Scenario: Basic symlink unmapping
    When I run `doting uninstall testing`
    Then a file named "~/.testrc" should not exist

  Scenario: Selective symlink unmapping
    Given a file named ".dotfiles/profiles/testing1.json" with:
    """
    {"symlinks": {"test1rc":".test1rc"}}
    """
    And an empty file named ".dotfiles/src/test1rc"

    When I run `doting install testing`
    And I run `doting install testing1`
    And I run `doting uninstall testing1`
    Then a file named "~/.test1rc" should not exist
    And a file named "~/.testrc" should exist 

