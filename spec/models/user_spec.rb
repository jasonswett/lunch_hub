require 'rails_helper'

RSpec.describe User, :type => :model do
  before do
    @user = FactoryGirl.build(:user)
  end

  it "gets a uid assigned" do
    @user.save!
    expect(@user.uid).not_to be_blank
  end

  it "doesn't send a confirmation email" do
    expect { @user.save! }.not_to change { ActionMailer::Base.deliveries.count }
  end

  it "takes group ids" do
    new_group = FactoryGirl.create(:group)
    user = User.create(group_ids: [new_group.id])

    expect(user.groups).to include(new_group)
  end

  describe "#as_json" do
    it "adds group ids" do
      group = FactoryGirl.create(:group)
      @user.groups << group
      expect(@user.as_json["group_ids"]).to eq([group.id])
    end
  end
end
