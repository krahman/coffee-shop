require 'rails_helper'

RSpec.describe Size, type: :model do
  it { should validate_presence_of(:name) }
end
