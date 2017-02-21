class Vote < ApplicationRecord
  belongs_to :cat

  validates :score, presence: true
  validates :cat_id, presence: true
end
