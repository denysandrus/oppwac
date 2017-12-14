class MatchMailer < ApplicationMailer
  default from: 'wac-company@example.com'

  def matching_email(opp)
    @opp = opp
    user = User.where('nationality' =>  @opp.nationality,
                      'residence' => @opp.residence).first
    @user = user

    mail to: user.email, subject: 'New WAC opportunity' unless user.nil?
  end
end
