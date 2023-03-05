class Favorite < ApplicationRecord
  validates :user_id, uniqueness: {scope: :activity_id}
  belongs_to :user
  belongs_to :activity
end
