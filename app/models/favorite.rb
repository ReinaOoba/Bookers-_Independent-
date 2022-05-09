class Favorite < ApplicationRecord
  belong_to :user
  belong_to :book
  validates_uniqueness_of :book_id, scope: :user_id
end
