module ProfilesHelper
  def profile_professional(profile_id)
    profile = Professional.where("profile_id = ?", profile_id)
  end

  def complete_percentage()

    percentage = 0
   if  current_user.profile.present?
    percentage += 20 if  current_user.profile.interests.present?
    percentage += 10  if current_user.profile.professionals[0].company_id.present?
    if current_user.profile.education.present?
      percentage += 10 if current_user.profile.education[0].school.present?


    end
   end

    #percentage += 30 if  user.educations.present?
    #percentage += 30 if  professional_industries.present?
    return percentage
  end

  def check_for_professional
    proff = current_user.profile.professionals
    proff.each do |endtime|
      if endtime.end_date!=""
        @proff_conut = 0
      end
    end
    return @proff_conut

  end

end
