class NotificationMailer < ActionMailer::Base
  default :from => Mailboxer.default_from
  #Sends and email for indicating a new notification to a receiver.
  #It calls new_notification_email.
  def send_email(notification,receiver)
    new_notification_email(notification,receiver)
  end

  include ActionView::Helpers::SanitizeHelper

  #Sends an email for indicating a new message for the receiver
  def new_notification_email(notification,receiver)
    @notification = notification
    @receiver = receiver
    subject = notification.subject.to_s
    subject = strip_tags(subject) unless subject.html_safe?
    mail :to => receiver.send(Mailboxer.email_method,notification),
         :subject => t('mailboxer.notification_mailer.subject', :subject => subject),
         :template_name => 'new_notification_email'
  end

  def feedback_email(email, title, category, message, current_form)
    mail :to => "praneetheee240@gmail.com", :subject => title, :body => "for" + " " + "#{current_form}" + " " + "#{category}""#{message}",:template_name => 'feedback_email'
  end
  def customer_email(email)
    mail(:to => email, :subject => "Feed back", :body =>"Thanks for giving feed back" )
  end
end
