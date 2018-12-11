class User < ApplicationRecord
  has_many :contens, dependent: :destroy
end
