require 'spec_helper'

describe "china_adventures/show" do
  before(:each) do
    @china_adventure = assign(:china_adventure, stub_model(ChinaAdventure,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
