module UsersHelper
  def check_for_post


    follow_users = current_user.all_following

    follow_users.each do |follow|

      @post_count = Post.where(user_id: follow.id).order('created_at').count
    end
    return @post_count
  end
end
