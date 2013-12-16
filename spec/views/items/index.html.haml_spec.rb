require 'spec_helper'

describe "items/index" do
  before(:each) do
    assign(:items, [
      stub_model(Item,
        :user_id => 1,
        :categorization_id => 2,
        :title => "Title",
        :size => "Size",
        :color => "Color"
      ),
      stub_model(Item,
        :user_id => 1,
        :categorization_id => 2,
        :title => "Title",
        :size => "Size",
        :color => "Color"
      )
    ])
  end

  it "renders a list of items" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
  end
end
