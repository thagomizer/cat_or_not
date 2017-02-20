class Vote < ApplicationRecord
  validates :score, presence: true
  validates :cat_id, presence: true
end
