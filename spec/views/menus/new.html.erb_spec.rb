require 'rails_helper'

RSpec.describe "menus/new", type: :view do
  before(:each) do
    assign(:menu, Menu.new(
      :name => "MyString",
      :price => "9.99",
      :type => nil,
      :size => nil
    ))
  end

  it "renders new menu form" do
    render

    assert_select "form[action=?][method=?]", menus_path, "post" do

      assert_select "input#menu_name[name=?]", "menu[name]"

      assert_select "input#menu_price[name=?]", "menu[price]"

      assert_select "input#menu_type_id[name=?]", "menu[type_id]"

      assert_select "input#menu_size_id[name=?]", "menu[size_id]"
    end
  end
end
