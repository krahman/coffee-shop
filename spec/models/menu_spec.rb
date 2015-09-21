require 'rails_helper'

RSpec.describe Menu, type: :model do
  it { should validate_presence_of(:name) } 	
  it { should validate_presence_of(:price) }
  it { should belong_to(:type) }
  it { should belong_to(:size) } 
end
