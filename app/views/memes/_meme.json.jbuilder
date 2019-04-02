json.extract! meme, :id, :name, :author, :title, :text, :url, :permalink, :created_at, :updated_at
json.url meme_url(meme, format: :json)
