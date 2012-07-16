require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home" do
    before { visit root_path }

    it "should have my name in the title" do
      should have_selector('title', text: "Donovan C. Young")
    end
  end
end
