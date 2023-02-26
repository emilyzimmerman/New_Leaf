json.extract! review, :id, :content, :date, :activity_id, :user_id, :created_at, :updated_at
json.url review_url(review, format: :json)
