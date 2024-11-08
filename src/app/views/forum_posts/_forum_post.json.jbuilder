json.extract! forum_post, :id, :post_topic, :post_text, :comments, :created_at, :updated_at
json.url forum_post_url(forum_post, format: :json)
