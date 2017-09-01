@term_manager @seo @content
Feature: Term Manager
  In order to save time managing terms
  As a SEO expert
  I want to upload a CSV file with bulk actions to be run against the taxonomy

  @term_manager_self_test
  Scenario: Check that Term Manager works as expected.
    Given I am managing the vocabulary "Term Manager Test" with Term Manager

    Given I create a taxonomy tree using "test_create_run.csv"
    Then I check that the taxonomy tree matches the contents of "test_create_pass.csv"

    When Term Manager processes "test_actions_run.csv"
    Then I check that the taxonomy tree matches the contents of "test_actions_pass.csv"

    When Term Manager processes dupe actions
    Then I check that the taxonomy tree matches the contents of "test_dupe_actions_pass.csv"

  @api @node
  Scenario: Check that term manager works as expected working with nodes.
    # Initialize taxonomy tree.
    Given I am managing the vocabulary "Category" with Term Manager
    Given I create a taxonomy tree using "test_create_run.csv"

    Given I have a "article" content:
      | title     | alias         | field_category_primary[und][0][value] |
      | Article 1 | term_manager1 | TM-Drupal                             |
      | Article 2 | term_manager2 | TM-Blackberry-0                       |
      | Article 3 | term_manager3 | TM-Mulberry                           |
      | Article 4 | term_manager4 | TM-Pineapple                          |
      | Article 5 | term_manager5 | TM-Multiple                           |
      | Article 6 | term_manager6 | TM-Raspberry-0                        |

    Given I am on "/tm-drupal"
    Then I should see the link "Article 1"

    Given I am on "/tm-blackberry-0"
    Then I should see the link "Article 2"

    Given I am on "/tm-mulberry"
    Then I should see the link "Article 3"

    Given I am on "/tm-pineapple"
    Then I should see the link "Article 4"

    Given I am on "/tm-multiple"
    Then I should see the link "Article 5"

    Given I am on "/tm-raspberry-0"
    Then I should see the link "Article 6"

    # Run actions.
    When Term Manager processes "test_actions_run.csv"

    # Test term rename.
    Given I am on "/tm-drupes"
    Then I should see the link "Article 1"

    # Test term merge.
    Given I am on "/tm-fruits"
    Then I should see the link "Article 2"

    Given I am on "/tm-aggregate"
    Then I should see the link "Article 2"

    Given I am on "/tm-blackberry"
    Then I should see the link "Article 2"

    # Test term delete.
    Given I am on "/tm-mulberry"
    Then I should not see the link "Article 3"

    # Test parent change.
    Given I am on "/tm-fruits"
    Then I should see the link "Article 4"

    Given I am on "/tm-simple"
    Then I should see the link "Article 4"

    Given I am on "/tm-hesperidiums"
    Then I should see the link "Article 4"

    Given I am on "/tm-pineapple"
    Then I should see the link "Article 4"

    # Test term that was deleted (Secondary category).
    Given I am on "/tm-multiple"
    Then I should not see the link "Article 5"

    # Run dupe actions.
    When Term Manager processes dupe actions

    # Test dupe actions on node.
    Given I am on "/tm-raspberry"
    When I follow "Article 6"
    Then I should be on "/term_manager6"
