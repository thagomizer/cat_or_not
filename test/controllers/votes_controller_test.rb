require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest
  def vote
    @vote ||= votes :garfield
  end

  def test_index
    get votes_url
    assert_response :success
  end

  def test_new
    get new_vote_url
    assert_response :success
  end

  def test_create
    assert_difference "Vote.count" do
      post votes_url, params: { vote: { cat_id: vote.cat_id,
                                        score:  7 } }
    end

    assert_redirected_to vote_path(Vote.last)
  end

  def test_show
    get vote_url(vote)
    assert_response :success
  end

  def test_edit
    get edit_vote_url(vote)
    assert_response :success
  end

  def test_update
    patch vote_url(vote), params: { vote: { cat_id: vote.cat_id,
                                            score: 6 } }
    assert_redirected_to vote_path(vote)
  end

  def test_destroy
    assert_difference "Vote.count", -1  do
      delete vote_url(vote)
    end

    assert_redirected_to votes_path
  end
end
