require 'spec_helper'

describe RSpec::Core do

  describe "#configuration" do

    it "returns the same object every time" do
      RSpec.configuration.should equal(RSpec.configuration)
    end

  end

  describe "#configure" do

    it "yields the current configuration" do
      RSpec.configure do |config|
        config.should == RSpec::configuration
      end
    end

  end

  describe "#world" do

    it "returns the RSpec::Core::World instance the current run is using" do
      RSpec.world.should be_instance_of(RSpec::Core::World)
    end

  end
  
  describe '#use_expectations' do
    
    context 'given @use_expectations is true' do
      before { RSpec.instance_variable_set(:@use_expectations, true) }
      
      it 'returns true' do
        RSpec.use_expectations.should be_true
      end
    end
    
    context 'given @use_expectations is false' do
      before { RSpec.instance_variable_set(:@use_expectations, false) }
      
      it 'returns false' do
        RSpec.use_expectations.should be_false
      end
    end
    
    context 'given @use_expectations is undefined' do
      before do
        RSpec.send(:remove_instance_variable, :@use_expectations)
      end
      
      it 'returns true' do
        RSpec.use_expectations.should be_true
      end
    end
  
  end
  
  describe '#use_expectations=()' do
    
    it 'sets @use_expectations to false' do
      RSpec.use_expectations = false
      RSpec.instance_variable_get(:@use_expectations).should be_false
    end
    
  end
end
