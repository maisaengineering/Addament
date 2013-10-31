class ConversationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_user_profile
  helper_method :mailbox, :conversation

  def index
    #@conversation = Conversation.all
  end

  def create
    #recipient_emails = conversation_params(:recipients).split(',')
    recipient_emails = params[:get_id].split(',')
    usermail = []
    recipient_emails.each do |prof_id|
      prof = Profile.find(prof_id)
      if prof
        user = User.find(prof.user_id)
        usermail.push(user.email)
      end
    end
    recipients = User.where(email: usermail).all

    conversation = current_user.
      send_message(recipients, *conversation_params(:body, :subject)).conversation

    redirect_to conversation
  end

  def reply
    current_user.reply_to_conversation(conversation, *message_params(:body, :subject))
    redirect_to conversation
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to :conversations
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to :conversations
  end

  def filter_result
    @conversation = Conversation.order('created_at desc')
    @mailtype = params[:mailboxtype]
    render :partial => 'conversation'
  end

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def recipients
    @recipients = current_user.following?(user)
  end

  def conversation_params(*keys)
    fetch_params(:conversation, *keys)
  end

  def message_params(*keys)
    fetch_params(:message, *keys)
  end

  def fetch_params(key, *subkeys)
    params[key].instance_eval do
      case subkeys.size
      when 0 then self
      when 1 then self[subkeys.first]
      else subkeys.map{|k| self[k] }
      end
    end
  end
end
