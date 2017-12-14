# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview
  def invite_mailer_preview
    InviteMailer.invite_email('fentg19@gmail.com')
  end
end
