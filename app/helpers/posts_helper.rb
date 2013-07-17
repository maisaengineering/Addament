module PostsHelper
  def comments_count(post_id)
   comment_count = post_id.comments.count
  end

  def check_users_count
    user = User.where("id != ?", current_user.id)
    i = 0
    user.each do |singleuser|
     unless current_user.following?(singleuser)
       reqtomentor = Requesttomentor.where(user_id: current_user.id, following_id:singleuser.id ).first
        unless reqtomentor
          i += 1
       end
       end
    end
    return i

  end
end
