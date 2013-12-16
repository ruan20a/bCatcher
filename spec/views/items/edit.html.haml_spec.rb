require 'spec_helper'

describe "items/edit" do
  before(:each) do
    @item = assign(:item, stub_model(Item,
      :user_id => 1,
      :categorization_id => 1,
      :title => "MyString",
      :size => "MyString",
      :color => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", item_path(@item), "post" do
      assert_select "input#item_user_id[name=?]", "item[user_id]"
      assert_select "input#item_categorization_id[name=?]", "item[categorization_id]"
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "input#item_size[name=?]", "item[size]"
      assert_select "input#item_color[name=?]", "item[color]"
    end
  end
end
