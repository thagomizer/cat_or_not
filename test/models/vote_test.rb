require "test_helper"

class VoteTest < ActiveSupport::TestCase
  def vote
    @vote ||= Vote.new
  end

  def test_valid
    refute vote.valid?

    vote.cat   = cats :garfield
    vote.score = 7

    assert vote.valid?
  end
end
