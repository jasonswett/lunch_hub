require 'spec_helper'

describe Announcement do
  before do
    @announcement = FactoryGirl.create(:announcement)
  end

  subject { @announcement }
  it { should be_valid }

  describe "when restaurant name is not present" do
    before { @announcement.restaurant_name = ' ' }
    it { should_not be_valid }
  end

  describe "when user is not present" do
    before { @announcement.user = nil }
    it { should_not be_valid }
  end
end
