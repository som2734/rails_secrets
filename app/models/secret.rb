class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user
  # will query all secrets that user has liked
end
