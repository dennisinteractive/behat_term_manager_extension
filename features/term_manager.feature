@term_manager @seo @content
Feature: Term Manager
  In order to save time managing terms
  As a SEO expert
  I want to upload a CSV file with bulk actions to be run against the taxonomy

  @term_manager_self_test @tm
  Scenario: Check that term manager works as expected.
    Given I create a taxonomy tree using "test_create_run.csv"
    Then I check that the taxonomy tree matches the contents of "test_create_pass.csv"

    When term manager processes "test_actions_run.csv"
    Then I check that the taxonomy tree matches the contents of "test_actions_pass.csv"

    When term manager processes dupe actions
    Then I check that the taxonomy tree matches the contents of "test_dupe_actions_pass.csv"
