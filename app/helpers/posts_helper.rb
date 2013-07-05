module PostsHelper
  def comments_count(post_id)
     @comment_count = Comment.where(post_id: post_id).count

  end
end
