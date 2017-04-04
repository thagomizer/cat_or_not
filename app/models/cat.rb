#
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
class Cat < ApplicationRecord
  has_many :votes

  has_attached_file :pic,
                    styles: {medium: "300x300>", thumb: "100x100>"},
                    default_url: "/images/:style/missing.png",
                    path: ":rails_env/cats/:id/:style/:basename.:extension",
                    url: ":rails_env/cats/:id/:style/:basename.:extension"

  validates_attachment_content_type :pic, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
end
