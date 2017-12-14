class InviteMailer < ApplicationMailer
  default from: 'wac-company@example.com'

  def invite_email(data)
    @address = data.email
    @message = data.message
    mail to: @address, subject: 'You are invited to WAC' unless @address.nil?
  end
end
