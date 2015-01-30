require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user, name: "Jason" ) }
  let(:default_params) { {} }
  let(:valid_session) { {} }
  let(:group) { FactoryGirl.create(:group) }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    controller.instance_variable_set(:@user, user)
  end

  describe "POST create" do
    context "duplicate registration" do
      it "has an error message than makes sense" do
        existing_user = FactoryGirl.create(:user)
        post :create, {
          email: existing_user.email,
          password: "aaaaaaaa",
          password_confirmation: "aaaaaaaa",
          confirm_success_url: ""
        }
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["errors"].first).to eq("Email has already been taken")
      end
    end
  end

  describe "PUT update" do
    it "takes a name" do
      put :update, { name: "Jase" }, valid_session
      expect(assigns(:user).name).to eq("Jase")
    end

    context "with group ids present" do
      it "saves the group associations" do
        put :update, { "group_ids" => [group.id] }, valid_session
        expect(assigns(:user).groups.collect(&:id)).to include(group.id)
      end
    end

    context "with no group ids present" do
      it "clears the group associations" do
        user.groups << group
        put :update, { "group_ids" => nil }, valid_session
        expect(assigns(:user).groups).to eq([])
      end
    end
  end
end
