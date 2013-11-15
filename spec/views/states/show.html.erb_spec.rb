require 'spec_helper'

describe "state/show" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :name => "Name",
      :abbreviation => "Abbreviation"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Abbreviation/)
  end
end
