require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      :name => "Espresso",
      :price => 9.99,
      :type => 1,
      :size => 1
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input#menu_name[name=?]", "menu[name]"

      assert_select "input#menu_price[name=?]", "menu[price]"

      assert_select "input#menu_type_id[name=?]", "menu[type_id]"

      assert_select "input#menu_size_id[name=?]", "menu[size_id]"
    end
  end
end
