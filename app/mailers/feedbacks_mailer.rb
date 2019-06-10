class FeedbacksMailer < ApplicationMailer

    def send_feedback(feedback)
     @user = feedback.user
     @message = feedback.message

      mail(to: @user.email)
   end

  end
