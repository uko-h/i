json.content    @new_post.content
json.image      @new_post.image.url
json.created_at @new_post.created_at.strftime("%Y年%m月%d日")
json.id @new_post.id
json.user_id current_user.id
json.category @category.id