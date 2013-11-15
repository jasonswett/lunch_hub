require 'spec_helper'

describe "state/index" do
  before(:each) do
    assign(:state, [
      stub_model(State,
        :name => "Name",
        :abbreviation => "Abbreviation"
      ),
      stub_model(State,
        :name => "Name",
        :abbreviation => "Abbreviation"
      )
    ])
  end

  it "renders a list of state" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Abbreviation".to_s, :count => 2
  end
end
