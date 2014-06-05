json.array!(@comments) do |comment|
  json.extract! comment, :id, :article_id, :user_id, :author_name, :site_url, :content
  json.url comment_url(comment, format: :json)
end
