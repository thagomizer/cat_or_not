require "test_helper"

class CatTest < ActiveSupport::TestCase
  def cat
    @cat ||= Cat.new
  end

  def test_valid
    refute cat.valid?

    cat.name = "Felix"
    cat.pic = sample_file

    assert cat.valid?
  end
end
