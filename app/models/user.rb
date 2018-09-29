class User < ActiveRecord::Base
  has_one :profile
  has_many :todo_lists, dependent: :destroy
end
