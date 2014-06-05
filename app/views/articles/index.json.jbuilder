json.array!(@articles) do |article|
  json.extract! article, :id, :name, :content, :author_name, :user_id
  json.url article_url(article, format: :json)
end
