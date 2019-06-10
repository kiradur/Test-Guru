class FeedbacksMailer < ApplicationMailer

  def send_feedback(feedback)
     @user = feedback.user
     @message = feedback.message
     
     mail(to: User.find_by(type: 'Admin').email)
   end

  end
