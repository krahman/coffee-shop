class Menu < ActiveRecord::Base
  belongs_to :type
  belongs_to :size
end
