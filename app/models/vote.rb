class Vote < ApplicationRecord
  belongs_to :cat

  validates :score, numericality: { only_integer: true,
                                    greater_than: 0,
                                    less_than: 11 },
            presence: true
  validates :cat_id, presence: true
end
