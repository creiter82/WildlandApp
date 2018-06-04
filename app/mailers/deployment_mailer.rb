class DeploymentMailer < ApplicationMailer
  default from: 'admin@afrwildlandteam.herokuapp.com'
  layout 'mailer'

  def new_deployment(deployment)
    @deployment = deployment
    @users = User.all
    emails = @users.collect(&:email).join(",")
    mail( 
         :to => [emails, 'fgray@auroragov.org', 'smills@auroragov.org', 'smcinern@auroragov.org', 'rweber@auroragov.org', 'lbridges@auroragov.org', 'kallen@auroragov.org'],
         :subject => "AFR Wildland Deployment"
         )
  end
end