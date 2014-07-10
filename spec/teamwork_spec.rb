require 'spec_helper'

describe Teamwork do

  it "returns a Teamwork::Client" do
    expect(Teamwork.client).to be_kind_of Teamwork::Client
  end

  it "forwards methods to its client" do
    expect(Teamwork.respond_to?(:authenticate)).to be true
  end

end