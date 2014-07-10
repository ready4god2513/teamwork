require 'spec_helper'

describe Teamwork::Client::Comment do

  before(:each) { authenticate }

  let(:comment_body) { {body: "Hey", notify: "", isprivate: false, pendingFileAttachments: ""} }
  let(:comment_id) { ENV["COMMENT_ID"] }
  let(:task) { ENV["TASK_ID"] }

  context "#get_comments" do

    it "responds" do
      expect(Teamwork.respond_to?(:get_comments)).to eq(true)
    end

    it "raises exception on invalid option" do
      expect { Teamwork.get_comments("sports", 14) }.to raise_error
    end

    it "builds array" do
      expect(Teamwork.get_comments("tasks", Teamwork.all_tasks.first.id)).to be_a(Array)
    end

  end

  context "#get_comment" do

    let(:comments) { Teamwork.get_comments("tasks", task) }

    it "responds" do
      expect(Teamwork.respond_to?(:get_comment)).to eq(true)
    end

    it "is a thing" do
      expect(Teamwork.get_comment(comments.first.id)).to be_a(Teamwork::Thing)
    end

  end

  context "#post_comment" do

    it "creates a comment" do
      expect(Teamwork.respond_to?(:post_comment)).to eq(true)
    end

    it "returns 201 on success" do
      expect(Teamwork.client.send(:post, "tasks/#{task}/comments.json", comment: comment_body).status).to eq(201)
    end

    it "returns the new comment" do
      expect(Teamwork.post_comment("tasks", task, comment_body)).to be_a(Teamwork::Thing)
    end

  end

  context "#update_comment" do

    it "creates a comment" do
      expect(Teamwork.respond_to?(:update_comment)).to eq(true)
    end

    it "returns 200 on success" do
      expect(Teamwork.update_comment(comment_id, comment_body)).to eq(200)
    end

  end

  context "#delete_comment" do

    it "deletes a comment" do
      expect(Teamwork.respond_to?(:delete_comment)).to eq(true)
    end

  end

end