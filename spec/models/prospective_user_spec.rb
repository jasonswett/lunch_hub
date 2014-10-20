require 'spec_helper'

describe ProspectiveUser, :type => :model do
  before do
    @prospective_user = ProspectiveUser.new(
      first_name: "John",
      email: "john.smith@example.com"
    )
  end

  subject { @prospective_user }

  it { is_expected.to respond_to(:first_name) }
  it { is_expected.to respond_to(:email) }
  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { @prospective_user.first_name = " " }
    it { is_expected.not_to be_valid }
  end

  describe "when email is not present" do
    before { @prospective_user.email = " " }
    it { is_expected.not_to be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[
        user@foo,com
        user_at_foo.org
        example.user@foo.
        foo@bar_baz.com foo@bar+baz.com
      ]
      addresses.each do |invalid_address|
        @prospective_user.email = invalid_address
        expect(@prospective_user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[
        user@foo.COM
        A_US-ER@f.b.org
        frst.lst@foo.jp
        a+b@baz.cn
      ]
      addresses.each do |valid_address|
        @prospective_user.email = valid_address
        expect(@prospective_user).to be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @prospective_user.dup
      user_with_same_email.email = @prospective_user.email.upcase
      user_with_same_email.save
    end

    it { is_expected.not_to be_valid }
  end
end
