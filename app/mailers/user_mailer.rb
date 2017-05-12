class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
  end

  def project_approved(project)
    @project = project
    @user = project.user
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Project Approval")
  end

  def donation_confirmed(user, amount)
    @user = user
    @amount = amount
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Project Donation")
  end

  def report_project(reason, project)
    @reason = reason
    @project = project
    redirect_url = Rails.configuration.email_confirmation['redirect_url']
    @project_link =  "#{redirect_url}/projects/#{project.id}"
    mail(:to => "report@crowdpouch.com", :subject => "Project Reported")
  end

end
