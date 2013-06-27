module ProfilesHelper
  def profile_professional(profile_id)
    profile = Professional.where("profile_id = ?", profile_id)
  end

  def complete_percentage()

    percentage = 0
    percentage += 20 if  current_user.profile.interests.present?
    percentage += 10  if current_user.profile.professionals[0].company_name.present?
     if current_user.profile.education.present?
       percentage += 10 if current_user.profile.education[0].scholl_name.present?


     end

    #percentage += 30 if  user.educations.present?
    #percentage += 30 if  professional_industries.present?
    return percentage
  end

end
