class Cat < ApplicationRecord
  has_many :votes

  has_attached_file :pic, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
end
