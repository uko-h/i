json.array! @posts do |post|
  json.content post.content
  json.image post.image.url
  json.created_at post.created_at.strftime("%Y年%m月%d日")
  json.id post.id
end