require 'rails_helper'

RSpec.describe "menus/index", type: :view do
  before(:each) do
    assign(:menus, [
      Menu.create!(
        :name => "Name",
        :price => "9.99",
        :type => nil,
        :size => nil
      ),
      Menu.create!(
        :name => "Name",
        :price => "9.99",
        :type => nil,
        :size => nil
      )
    ])
  end

  it "renders a list of menus" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
