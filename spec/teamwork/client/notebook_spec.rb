require 'spec_helper'

describe Teamwork::Client::Notebook do

  before(:each) { authenticate }

  context "#get_notebooks" do

    it "should respond" do
      expect(Teamwork.respond_to?(:get_notebooks)).to eq(true)
    end

    it "should get notebooks" do
      expect(Teamwork.get_notebooks).to be_a(Array)
    end

  end

end