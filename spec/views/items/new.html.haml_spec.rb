require 'spec_helper'

describe "items/new" do
  before(:each) do
    assign(:item, stub_model(Item,
      :user_id => 1,
      :categorization_id => 1,
      :title => "MyString",
      :size => "MyString",
      :color => "MyString"
    ).as_new_record)
  end

  it "renders new item form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", items_path, "post" do
      assert_select "input#item_user_id[name=?]", "item[user_id]"
      assert_select "input#item_categorization_id[name=?]", "item[categorization_id]"
      assert_select "input#item_title[name=?]", "item[title]"
      assert_select "input#item_size[name=?]", "item[size]"
      assert_select "input#item_color[name=?]", "item[color]"
    end
  end
end
