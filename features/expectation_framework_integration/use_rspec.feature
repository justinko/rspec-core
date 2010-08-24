Feature: expect with RSpec

  As an RSpec user who likes to use expectations
  I want to be able to use RSpec

  Scenario: expect with RSpec
    Given a file named "rspec_example_spec.rb" with:
      """
      RSpec.configure do |config|
        config.expectation_framework = :rspec
      end

      describe "plugging in RSpec" do
        it "allows RSpec to be used" do
          nil.should be_nil
        end
      end
      """
    When I run "rspec rspec_example_spec.rb"
    Then the output should contain "1 example, 0 failures" 
    And the exit status should be 0