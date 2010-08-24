Feature: expect with Test::Unit

  As an RSpec user who likes to use expectations
  I want to be able to use Test::Unit

  Scenario: expect with Test::Unit
    Given a file named "test_unit_example_spec.rb" with:
      """
      RSpec.configure do |config|
        config.expectation_framework = :test_unit
      end

      describe "plugging in Test::Unit" do
        it "allows Test::Unit to be used" do
          assert(true)
        end
      end
      """
    When I run "rspec test_unit_example_spec.rb"
    Then the output should contain "1 example, 0 failures" 
    And the exit status should be 0