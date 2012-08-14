require "spec_helper"

describe ChinaAdventuresController do
  describe "routing" do

    it "routes to #index" do
      get("/china_adventures").should route_to("china_adventures#index")
    end

    it "routes to #new" do
      get("/china_adventures/new").should route_to("china_adventures#new")
    end

    it "routes to #show" do
      get("/china_adventures/1").should route_to("china_adventures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/china_adventures/1/edit").should route_to("china_adventures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/china_adventures").should route_to("china_adventures#create")
    end

    it "routes to #update" do
      put("/china_adventures/1").should route_to("china_adventures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/china_adventures/1").should route_to("china_adventures#destroy", :id => "1")
    end

  end
end
