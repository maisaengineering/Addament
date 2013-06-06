module ProfilesHelper
  def profile_professional(profile_id)
    profile = Professional.where("profile_id = ?", profile_id)
  end
end
