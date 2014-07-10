require 'spec_helper'

describe Teamwork::Client::Task do

  before(:each) { authenticate }

  context "#all_tasks" do

    it "should respond" do
      expect(Teamwork.respond_to?(:all_tasks)).to eq(true)
    end

    it "should build an array" do
      expect(Teamwork.all_tasks).to be_a(Array)
    end

  end

end