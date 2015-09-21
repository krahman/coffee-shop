class Order < ActiveRecord::Base
  belongs_to :menu

  validates :qty, presence: true
end
