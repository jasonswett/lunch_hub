require 'spec_helper'

describe Group, :type => :model do
  before do
    @group = Group.new(
      name: "Acme",
      description: ""
    )
  end

  subject { @group }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to be_valid }

  describe "when name is not present" do
    before { @group.name = " " }
    it { is_expected.not_to be_valid }
  end

  describe "when name is already taken" do
    before do
      group_with_same_name = @group.dup
      group_with_same_name.name = @group.name.upcase
      group_with_same_name.save
    end

    it { is_expected.not_to be_valid }
  end
end
