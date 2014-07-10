require 'spec_helper'

describe Teamwork::Client::File do

  before(:each) { authenticate }

  context "#get_file" do

    let(:file_id) { ENV["FILE_ID"] }

    it "should respond" do
      expect(Teamwork.respond_to?(:get_file)).to eq(true)
    end

    it "should get files" do
      expect(Teamwork.get_file(file_id)).to be_a(Teamwork::Thing)
    end

  end

  context "#project_files" do

    let(:project_id) { ENV["PROJECT_ID"] }
    let(:files) { Teamwork.project_files(project_id) }

    it "retrieves files" do
      expect(files).to be_a(Array)
    end

    it "isn't empty" do
      expect(files).to_not be_empty
    end

  end

end