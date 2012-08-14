require 'spec_helper'

describe "china_adventures/index" do
  before(:each) do
    assign(:china_adventures, [
      stub_model(ChinaAdventure,
        :title => "Title",
        :content => "MyText"
      ),
      stub_model(ChinaAdventure,
        :title => "Title",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of china_adventures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
