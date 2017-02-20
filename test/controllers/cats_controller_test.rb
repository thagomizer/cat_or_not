require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  def cat
    @cat ||= cats :one
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
      post cats_url, params: { cat: {  } }
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
    patch cat_url(cat), params: { cat: {  } }
    assert_redirected_to cat_path(cat)
  end

  def test_destroy
    assert_difference "Cat.count", -1  do
      delete cat_url(cat)
    end

    assert_redirected_to cats_path
  end
end
