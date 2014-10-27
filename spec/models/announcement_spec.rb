require 'spec_helper'

describe Announcement, :type => :model do
  before do
    @user = FactoryGirl.create(:user)
    @announcement = FactoryGirl.create(:announcement, user: @user)
  end

  subject { @announcement }
  it { is_expected.to be_valid }

  describe 'when restaurant name is not present' do
    before { @announcement.restaurant_name = ' ' }
    it { is_expected.not_to be_valid }
  end

  describe 'when user is not present' do
    before { @announcement.user = nil }
    it { is_expected.not_to be_valid }
  end

  describe 'when an announcement has already been made' do
    it 'deletes the old announcement' do
      expect {
        FactoryGirl.create(:announcement, user: @user)
      }.not_to change { @user.reload.announcements.count }
    end

    it "doesn't delete announcements from before today" do
      Announcement.destroy_all
      FactoryGirl.create(:announcement, user: @user, created_at: 10.days.ago)

      expect {
        FactoryGirl.create(:announcement, user: @user)
      }.to change { @user.reload.announcements.count }.by(1)
    end

    it "doesn't delete other users' announcements" do
      FactoryGirl.create(:announcement)
      expect { @announcement.reload }.not_to raise_error
    end
  end

  describe 'for_today' do
    before do
      @announcement_from_today = FactoryGirl.create(:announcement)
      @announcement_not_from_today = FactoryGirl.create(:announcement, created_at: Time.zone.today - 5.days)
    end

    it 'excludes announcements not from today' do
      expect(Announcement.for_today).not_to include(@announcement_not_from_today)
    end

    it 'includes announcements from today' do
      expect(Announcement.for_today).to include(@announcement_from_today)
    end
  end
end
