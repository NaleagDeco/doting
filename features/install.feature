Feature: Install dotfiles
    There should be a command to install dotfiles via symlinks
    There should be a mechanism for saying which files go where
    Running the installation multiple times shouldn't break anything
    Installation should handle getting files from subdirectories
    Installation should handle context-specific variations (work, home)

@announce
Scenario: Basic symlink mapping
  Given a mocked home directory
  When I run `doting install`
  Then a file named "~/.testrc" should exist

@announce
Scenario: Basic symlink unmapping
  Given a mocked home directory
  When I run `doting uninstall`
  Then a file named "~/.testrc" should not exist
