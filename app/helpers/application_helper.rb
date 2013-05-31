module ApplicationHelper
	def profile
		profille = Profile.where(:user_id=> current_user.id).first
	end
end
