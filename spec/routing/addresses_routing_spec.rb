require "spec_helper"

describe AddressesController do
  describe "routing" do

    it "routes to #index" do
      get("/address").should route_to("address#index")
    end

    it "routes to #new" do
      get("/address/new").should route_to("address#new")
    end

    it "routes to #show" do
      get("/address/1").should route_to("address#show", :id => "1")
    end

    it "routes to #edit" do
      get("/address/1/edit").should route_to("address#edit", :id => "1")
    end

    it "routes to #create" do
      post("/address").should route_to("address#create")
    end

    it "routes to #update" do
      put("/address/1").should route_to("address#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/address/1").should route_to("address#destroy", :id => "1")
    end

  end
end
