require 'spec_helper'

describe Teamwork::Client::Message do

  before(:each) { authenticate }

  context "#project_messages" do

    it "should respond" do
      expect(Teamwork.respond_to?(:project_messages)).to eq(true)
    end

    it "should get messages" do
      expect(Teamwork.project_messages(Teamwork.projects.first.id)).to be_a(Array)
    end

  end

  context "#get_message" do

    let(:message_id) { ENV["MESSAGE_ID"] }

    it "should respond" do
      expect(Teamwork.respond_to?(:get_message)).to eq(true)
    end

    it "should get messages" do
      expect(Teamwork.get_message(message_id)).to be_a(Teamwork::Thing)
    end

  end

end