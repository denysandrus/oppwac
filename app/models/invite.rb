class Invite < ApplicationRecord
  after_create do |u|
    InviteMailer.invite_email(u).deliver_now
  end
end
