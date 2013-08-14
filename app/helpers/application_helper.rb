module ApplicationHelper
	def profile
		profille = Profile.where(:user_id=> current_user.id).first
  end
  def check_message
    mesage = Receipt.where(receiver_id: current_user.id, mailbox_type: 'inbox', is_read: '0' ).count
  end
  def change_is_read(receipt)
    receipt_is_read = Receipt.find(receipt.id)
    receipt_is_read.update_column(:is_read, '1')
  end

  def get_user_list
    @user_list = []
    @follow_user = []
    @unfollow_user = []
    all_user = User.all
    all_user.each do |checkuser|
       if current_user.following?(checkuser)
         @follow_user.push(checkuser)
       else
         @unfollow_user.push(checkuser)
       end
    end
      alluser = @follow_user.concat(@unfollow_user)
      alluser.each do |getprofile|
        get_profile = Profile.find_by_user_id(getprofile.id)
        if get_profile
          @user_list.push(get_profile)
        end
      end
    return @user_list
  end
end
