Feature: Middleman-Remove-indent with Subdirectory

  Scenario: Basic Settings
    Given a fixture app "subdirectory-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indent
      end
      """
    And a successfully built app at "subdirectory-app"
    When I cd to "build"
    Then the file "subdir/index.html" should match /^<head>/
    And the file "subdir/index.html" should match /^\n/
    And the file "stylesheets/subdir/all.css" should match /^\.doc:before/
    And the file "stylesheets/subdir/all.css" should match /^\n/

  Scenario: With ':remove_blank_line' option
    Given a fixture app "subdirectory-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indent, :remove_blank_line => true
      end
      """
    And a successfully built app at "subdirectory-app"
    When I cd to "build"
    Then the file "subdir/index.html" should match /^<head>/
    And the file "subdir/index.html" should not match /^\n/
    And the file "stylesheets/subdir/all.css" should match /^\.doc:before/
    And the file "stylesheets/subdir/all.css" should not match /^\n/

  Scenario: Remove indent only html with :exts option
    Given a fixture app "subdirectory-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indent, :exts => %(.html)
      end
      """
    And a successfully built app at "subdirectory-app"
    When I cd to "build"
    Then the file "subdir/index.html" should match /^<head>/
    And the file "subdir/index.html" should match /^\n/
    And the file "stylesheets/subdir/all.css" should not match /^\.doc:before/
    And the file "stylesheets/subdir/all.css" should match /^\n/

  Scenario: Remove indent only css with :exts option
    Given a fixture app "subdirectory-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indent, :exts => %(.css)
      end
      """
    And a successfully built app at "subdirectory-app"
    When I cd to "build"
    Then the file "subdir/index.html" should not match /^<head>/
    And the file "subdir/index.html" should not match /^\n/
    And the file "stylesheets/subdir/all.css" should match /^\.doc:before/
    And the file "stylesheets/subdir/all.css" should match /^\n/

  Scenario: With ':remove_blank_line' & ':exts'
    Given a fixture app "subdirectory-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indent, :remove_blank_line => true, :exts => %(.css)
      end
      """
    And a successfully built app at "subdirectory-app"
    When I cd to "build"
    Then the file "subdir/index.html" should not match /^<head>/
    And the file "subdir/index.html" should not match /^\n/
    And the file "stylesheets/subdir/all.css" should match /^\.doc:before/
    And the file "stylesheets/subdir/all.css" should not match /^\n/
