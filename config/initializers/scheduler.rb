require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

#scheduler.every '3s' do
#end
scheduler.every '1d' do

  today_now = Time.now

  reqtomentor = Requesttomentor.all
  reqtomentor.each do |req_mentor|

    datediff =  today_now.to_date.mjd - req_mentor.created_at.to_date.mjd
    if (datediff >= 7 && req_mentor.status == 'pending')
      req_mentor.destroy
    end

  end

end