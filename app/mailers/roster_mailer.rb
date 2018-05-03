class RosterMailer < ApplicationMailer
  default from: 'admin@afrwildlandteam.herokuapp.com'
  layout 'mailer'

  def new_roster_avail(roster)
    @roster = roster
    @users = User.all
    emails = @users.collect(&:email).join(",")
    mail(to: emails, subject: 'New Roster Available for Signup')
  end
end