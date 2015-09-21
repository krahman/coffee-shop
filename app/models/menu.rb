class Menu < ActiveRecord::Base
  belongs_to :type
  belongs_to :size

  validates :name, presence: true
  validates :price, presence: true
end
