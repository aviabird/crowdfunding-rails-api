class ApplicationMailer < ActionMailer::Base
  default from: 'mail.admin@crowdpouch.com'
  layout 'mailer'
end
