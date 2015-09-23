require 'rails_helper'

RSpec.describe "sizes/show", type: :view do
  before(:each) do
    @size = assign(:size, Size.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
