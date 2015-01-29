require "rails_helper"

feature "Profile", js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    login_page = LoginPage.new
    login_page.visit
    login_page.sign_in(@user.email, @user.password)
    
    @profile_page = ProfilePage.new
    @profile_page.visit
  end

  it "shows an update message" do
    @profile_page.complete_form(name: "Jason")
    expect(@profile_page).to have_success_message
  end

  it "saves the new name" do
    new_name = "Jason"
    @profile_page.complete_form(name: new_name)
    expect(@profile_page).to have_success_message

    @profile_page.visit
    expect(page).to have_field("name", with: new_name)
  end

  describe "groups" do
    let(:field_values) { { name: "Jim" } }
    before { @group = FactoryGirl.create(:group) }

    context "when some groups are selected" do
      it "has a place to select groups" do
        @profile_page.visit
        check "group-#{@group.id}"
        @profile_page.complete_form(field_values)
        expect(@profile_page).to have_success_message

        @profile_page.visit
        expect(@profile_page.group_checkbox(@group)).to be_checked
      end
    end

    context "when all groups are blank" do
      it "clears the old selection" do
        @user.groups << @group
        @profile_page.visit
        expect(@profile_page.group_checkbox(@group)).to be_checked

        uncheck "group-#{@group.id}"
        @profile_page.complete_form(field_values)
        expect(@profile_page).to have_success_message

        @profile_page.visit
        expect(@profile_page.group_checkbox(@group)).not_to be_checked
      end
    end
  end
end
