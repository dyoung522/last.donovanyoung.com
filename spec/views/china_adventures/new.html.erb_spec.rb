require 'spec_helper'

describe "china_adventures/new" do
  before(:each) do
    assign(:china_adventure, stub_model(ChinaAdventure,
      :title => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new china_adventure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => china_adventures_path, :method => "post" do
      assert_select "input#china_adventure_title", :name => "china_adventure[title]"
      assert_select "textarea#china_adventure_content", :name => "china_adventure[content]"
    end
  end
end
