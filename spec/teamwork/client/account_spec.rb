require 'spec_helper'

describe Teamwork::Client::Account do

  context "#authenticate" do

    before(:each) do
      Teamwork.api_key = ''
      Teamwork.subdomain = ''
    end

    it "responds" do
      expect(Teamwork.authenticate(ENV["API_KEY"])).to be_a(Teamwork::Thing)
    end

    it "sets subdomain" do
      expect { Teamwork.authenticate(ENV["API_KEY"]) }.to change{Teamwork.subdomain}.to ENV["SUBDOMAIN"]
    end

    it "sets api key" do
      expect { Teamwork.authenticate(ENV["API_KEY"]) }.to change{Teamwork.api_key}.to ENV["API_KEY"]
    end

    context "bad keys" do

      it "raises error" do
        expect(Teamwork.authenticate("this-should-blow-up")).to eq(401)
      end

    end

  end

  context "#account_info" do

    before(:each) { authenticate }

    it "is a thing" do
      expect(Teamwork.account_info).to be_a(Teamwork::Thing)
    end

    it "fails if not authenticated" do
      Teamwork.authenticate("no-good-key")
      expect { Teamwork.account_info }.to raise_error
    end

    it "fills out the name" do
      expect(Teamwork.account_info.name).to_not be_nil
    end

  end

end