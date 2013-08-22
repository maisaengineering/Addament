class FeedbackController < ApplicationController
  before_filter :check_user_profile
  helper_method :mailbox, :conversation

  def new

  end

  def privacy_policy

  end
  def send_email

    if params[:current_form] == "users"  && params[:current_action] == "show"
      form_name = "Dashboard"
    elsif  params[:current_form] == "profiles"
      form_name = "profiles"
    elsif params[:current_form] == "conversations"
      form_name = "Messages"
    elsif params[:current_form] == "users" && params[:current_action] == "public_profile"
      form_name = "Public Profile"
    else
      form_name = "Path"
    end

    NotificationMailer.feedback_email(params[:email],params[:title], params[:category], params[:message], form_name).deliver
    #NotificationMailer.customer_email(params[:email]).deliver
    redirect_to my_account_path
  end

  def change_priority
  update_priority = Receipt.find(params[:message_id])
  update_priority.update_column(:priority, params[:color])
  end

  def filter_data

    @profile_result = User.where("user_role like ? and id != ?", "%#{params[:search_value]}%", current_user.id)
    @company_name = Company.where("company_name like ?", "%#{params[:search_value]}%")

    @education = Education.where("school like ?", "%#{params[:search_value]}%")
     render :partial => "filter_data"
  end

  def search_for_user

  end

  def show_user_profile
    @prof_res = []
    @comp_res = []
    @school_res = []
    if(params[:loation]!="" && params[:company]!="" && params[:school]!="")
      location_result = Profile.where("location like ?", "%#{params[:loation]}%")
      if location_result
        location_result.each do |prof_res|

          @prof_res.push(prof_res)
        end
      end
      @comp_name = Company.where("company_name like ?", "%#{params[:company]}%").first
      all_prof = Professional.all
      all_prof.each do |check_comp|
        if (check_comp.company_id == @comp_name.id)
          @comp_res.push(check_comp)
        end
      end
      @school = School.where("school_name like ?", "%#{params[:school]}%").first
      all_edu = Education.all
      all_edu.each do |check_edu|
        if (check_edu.school_id == @school.id)
          @school_res.push(check_edu)
        end
      end
    elsif(params[:loation]!="" && params[:company]!="")
      location_result = Profile.where("location like ?", "%#{params[:loation]}%")
      if location_result
        location_result.each do |prof_res|

          @prof_res.push(prof_res)
        end
      end
      @comp_name = Company.where("company_name like ?", "%#{params[:company]}%").first
      all_prof = Professional.all
      all_prof.each do |check_comp|
        if (check_comp.company_id == @comp_name.id)
          @comp_res.push(check_comp)
        end
      end
    elsif(params[:loation]!="")
    location_result = Profile.where("location like ?", "%#{params[:loation]}%")
    if location_result
      location_result.each do |prof_res|

        @prof_res.push(prof_res)
      end
      end

    elsif(params[:company]!="")
      puts "--------com"
      @comp_name = Company.where("company_name like ?", "%#{params[:company]}%").first
      all_prof = Professional.all
      all_prof.each do |check_comp|
        if (check_comp.company_id == @comp_name.id)
          @comp_res.push(check_comp)
        end
      end
    elsif(params[:school!=""])
      @school = School.where("school_name like ?", "%#{params[:school]}%").first
      all_edu = Education.all
      all_edu.each do |check_edu|
        if (check_edu.school_id == @school.id)
          @school_res.push(check_edu)
        end
      end

    end
    if @school_res
      @school_res.each do |get_prof|
        prof = Profile.where("id = ?", get_prof.profile_id).first
        if prof
          @prof_res.push(prof)
        end
      end
    end
    if @comp_res
      @comp_res.each do |get_prof|
        prof = Profile.where("id = ?", get_prof.profile_id).first
        if prof
          @prof_res.push(prof)
        end
      end
    end


    render :partial => "all_user_list"

  end


end
