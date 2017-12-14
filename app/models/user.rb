class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :role
  belongs_to :current_education, class_name: 'Education'
  belongs_to :looking_education, class_name: 'Education'
  has_many :opportunities
  has_many :wishlist_items

  mount_uploader :picture, PictureUploader

  after_create do |u|
    if Coupon.find_by code: u[:coupon].to_s
      code = Coupon.where(code: u[:coupon].to_s)
      code.redeem
    elsif Invite.find_by email: u[:email]
      user = Invite.find_by email: u[:email]
      user.status = 'active'
      user.save
    end
    if u[:role_id] == 2

    end
  end

  def test_deadline
    datetime = created_at.to_datetime.+ 5.days + 2.hours
    datetime.strftime('%Y-%m-%d %H:%M:%S')
  end

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end

  def organization?
    !role.nil? && role.name == 'organization'
  end

  def verified?
    verification_status == 'verified'
  end
end
