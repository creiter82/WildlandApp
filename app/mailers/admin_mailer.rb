class AdminMailer < ApplicationMailer
  default from: 'AFRWildlandTeam@example.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'reiter303@hotmail.com', subject: 'New User Awaiting Admin Approval')
  end
end
