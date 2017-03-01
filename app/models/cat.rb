class Cat < ApplicationRecord
  has_many :votes

  has_attached_file :pic,
                    styles: {medium: "300x300>", thumb: "100x100>"},
                    default_url: "/images/:style/missing.png",
                    storage: :fog,
                    fog_credentials: "#{Rails.root}/config/secrets.yml",
                    fog_directory: "catornotphotos",
                    path: ":rails_env/cats/:id/:style/:basename.:extension",
                    url: ":rails_env/cats/:id/:style/:basename.:extension"

  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
end
