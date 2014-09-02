Feature: Middleman-Remove-Indention

  Scenario: Basic Settings
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indention
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should match /^<head>/
    And the file "index.html" should match /^\n/
    And the file "stylesheets/all.css" should match /^\.doc:before/
    And the file "stylesheets/all.css" should match /^\n/

  Scenario: With ':remove_blank_line' option
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indention, :remove_blank_line => true
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should match /^<head>/
    And the file "index.html" should not match /^\n/
    And the file "stylesheets/all.css" should match /^\.doc:before/
    And the file "stylesheets/all.css" should not match /^\n/

  Scenario: Remove indention only html with :exts option
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indention, :exts => %(.html)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should match /^<head>/
    And the file "index.html" should match /^\n/
    And the file "stylesheets/all.css" should not match /^\.doc:before/
    And the file "stylesheets/all.css" should match /^\n/

  Scenario: Remove indention only css with :exts option
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indention, :exts => %(.css)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should not match /^<head>/
    And the file "index.html" should not match /^\n/
    And the file "stylesheets/all.css" should match /^\.doc:before/
    And the file "stylesheets/all.css" should match /^\n/

  Scenario: Remove indention only html with :exts option as string
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indention, :exts => '.html'
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should match /^<head>/
    And the file "index.html" should match /^\n/
    And the file "stylesheets/all.css" should not match /^\.doc:before/
    And the file "stylesheets/all.css" should match /^\n/

  Scenario: With ':remove_blank_line' & ':exts'
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remove_indention, :remove_blank_line => true, :exts => %(.css)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the file "index.html" should not match /^<head>/
    And the file "index.html" should not match /^\n/
    And the file "stylesheets/all.css" should match /^\.doc:before/
    And the file "stylesheets/all.css" should not match /^\n/
