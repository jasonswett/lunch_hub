require 'spec_helper'

describe Group do
  before do
    @group = Group.new(
      name: "Acme",
      description: ""
    )
  end

  subject { @group }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should be_valid }

  describe "when name is not present" do
    before { @group.name = " " }
    it { should_not be_valid }
  end

  describe "when name is already taken" do
    before do
      group_with_same_name = @group.dup
      group_with_same_name.name = @group.name.upcase
      group_with_same_name.save
    end

    it { should_not be_valid }
  end
end
