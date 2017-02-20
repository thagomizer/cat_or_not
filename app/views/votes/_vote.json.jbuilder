json.extract! vote, :id, :score, :cat_id, :created_at, :updated_at
json.url vote_url(vote, format: :json)