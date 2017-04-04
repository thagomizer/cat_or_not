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
require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  def cat
    @cat ||= cats :garfield
  end

  def file
    @file ||= Rack::Test::UploadedFile.new(File.join(ActionDispatch::IntegrationTest.fixture_path, "files/cat.jpg"), "image/jpg")
  end

  def test_index
    get cats_url
    assert_response :success
  end

  def test_new
    get new_cat_url
    assert_response :success
  end

  def test_create
    assert_difference "Cat.count" do
      post cats_url, params: { cat: {name: "Nermal",
                                     pic:  file}}
    end

    assert_redirected_to cat_path(Cat.last)
  end

  def test_show
    get cat_url(cat)
    assert_response :success
  end

  def test_edit
    get edit_cat_url(cat)
    assert_response :success
  end

  def test_update
    patch cat_url(cat), params: { cat: {name: "Sylvester",
                                        pic:   file }}
    assert_redirected_to cat_path(cat)
  end

  def test_destroy
    assert_difference "Cat.count", -1  do
      delete cat_url(cat)
    end

    assert_redirected_to cats_path
  end
end
