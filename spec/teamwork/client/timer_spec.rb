require 'spec_helper'

describe Teamwork::Client::Timer do

  before(:each) { authenticate }

  context "#time_entries" do

    it "responds" do
      expect(Teamwork.respond_to?(:time_entries)).to be true
    end

    it "Array" do
      expect(Teamwork.time_entries).to be_a(Array)
    end

  end

  context "#time_entry" do

    it "fetches a single item" do
      expect(Teamwork.time_entry(Teamwork.time_entries.first.id)).to be_a(Teamwork::Thing)
    end

  end

end