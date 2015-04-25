Feature: Install dotfiles

    There should be a command to install dotfiles via symlinks
    There should be a mechanism for saying which files go where
    Running the installation multiple times shouldn't break anything
    Installation should handle getting files from subdirectories
    Installation should handle context-specific variations (work, home)


  Background:
    Given a mocked home directory
    And a directory named ".dotfiles/profiles"
    And a directory named ".dotfiles/src"

    And a file named ".dotfiles/profiles/testing.json" with:
    """
    {"testrc":".testrc"}
    """
    And an empty file named ".dotfiles/src/testrc"

  Scenario: Basic symlink mapping
    When I run `doting install testing`
    Then a file named "~/.testrc" should exist

  Scenario: Selective symlink mapping
    Given a file named ".dotfiles/profiles/testing1.json" with:
    """
    {"test1rc":".test1rc"}
    """
    And an empty file named ".dotfiles/src/test1rc"

    When I run `doting install testing1`
    Then a file named "~/.test1rc" should exist
    And a file named "~/.testrc" should not exist 
