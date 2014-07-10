require 'spec_helper'

describe Teamwork::Client::People do

  before(:each) { authenticate }

  context "#get_people" do

    it "should respond" do
      expect(Teamwork.respond_to?(:get_people)).to eq(true)
    end

    it "should get people" do
      expect(Teamwork.get_people).to be_a(Array)
    end

  end

  context "#project_people" do

    it "should respond" do
      expect(Teamwork.respond_to?(:project_people)).to eq(true)
    end

    it "should get people" do
      expect(Teamwork.project_people(Teamwork.projects.first.id)).to be_a(Array)
    end

  end

end