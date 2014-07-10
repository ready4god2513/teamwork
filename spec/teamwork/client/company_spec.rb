require 'spec_helper'

describe Teamwork::Client::Company do

  before(:each) { authenticate }

  context "#get_companies" do

    it "should respond" do
      expect(Teamwork.respond_to?(:get_companies)).to eq(true)
    end

    it "should get people" do
      expect(Teamwork.get_companies).to be_a(Array)
    end

  end

  context "#project_companies" do

    it "should respond" do
      expect(Teamwork.respond_to?(:project_companies)).to eq(true)
    end

    it "should get companies" do
      expect(Teamwork.project_companies(Teamwork.projects.first.id)).to be_a(Array)
    end

  end

end