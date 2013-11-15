require 'spec_helper'

describe "state/edit" do
  before(:each) do
    @state = assign(:state, stub_model(State,
      :name => "MyString",
      :abbreviation => "MyString"
    ))
  end

  it "renders the edit state form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", state_path(@state), "post" do
      assert_select "input#state_name[name=?]", "state[name]"
      assert_select "input#state_abbreviation[name=?]", "state[abbreviation]"
    end
  end
end
