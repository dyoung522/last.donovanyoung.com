require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home" do
    before { visit root_path }

    it "should have my name in the title" do
      should have_selector('title', text: "Donovan C. Young")
    end
  end

  describe "Resume" do
    before { visit resume_path }

    it { should have_selector('#text-logo', text: 'Resum') }
  end
end
