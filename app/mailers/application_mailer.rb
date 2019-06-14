class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <kiradura.think@gmail.com>}
  layout 'mailer'
end
