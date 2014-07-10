require 'spec_helper'

describe Teamwork::Client::Project do

  before(:each) { authenticate }

  context "#project_activity" do

    let(:project_id) { ENV["PROJECT_ID"] }
    let(:activity) { Teamwork.project_activity(project_id) }

    it "retrieves activity" do
      expect(activity).to be_a(Array)
    end

    it "isn't empty" do
      expect(activity).to_not be_empty
    end

  end

  context "#project_timers" do

    # This one is interesting as if timers have not been enabled for
    # the project the API returns a 404 rather than an empty array.
    # The difficulty here is that listing all the projects doesn't show whether
    # the project has enabled a timer or not.  We will need to set something
    # up with VCR here.
    let(:project_id) { ENV["PROJECT_ID"] }
    let(:timers) { Teamwork.project_timers(project_id) }

    it "retrieves activity" do
      expect(timers).to be_a(Array)
    end

  end

end