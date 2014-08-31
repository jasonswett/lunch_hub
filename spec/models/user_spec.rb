require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create(:user)
  end

  it "gets a uid assigned" do
    expect(@user.uid).not_to be_blank
  end
end
