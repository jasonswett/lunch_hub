require 'rails_helper'

RSpec.describe RegistrationsController, :type => :controller do
  let(:user) { FactoryGirl.create(:user, name: "Jason" ) }
  let(:default_params) { {} }
  let(:valid_session) { {} }

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    controller.instance_variable_set(:@user, user)
  end

  describe "PUT update" do
    it "takes a name" do
      put :update, { name: "Jase" }, valid_session
      expect(assigns(:user).name).to eq("Jase")
    end

    it "takes group ids" do
      group = FactoryGirl.create(:group)
      put :update, { "group_ids" => [group.id] }, valid_session
      expect(assigns(:user).groups.collect(&:id)).to include(group.id)
    end
  end
end
