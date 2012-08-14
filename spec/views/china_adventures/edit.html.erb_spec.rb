require 'spec_helper'

describe "china_adventures/edit" do
  before(:each) do
    @china_adventure = assign(:china_adventure, stub_model(ChinaAdventure,
      :title => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit china_adventure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => china_adventures_path(@china_adventure), :method => "post" do
      assert_select "input#china_adventure_title", :name => "china_adventure[title]"
      assert_select "textarea#china_adventure_content", :name => "china_adventure[content]"
    end
  end
end
