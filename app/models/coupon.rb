class Coupon < ApplicationRecord
  def redeem
    self.usage_limit = usage_limit - 1
    self.status = 'used up' if usage_limit.zero?
    save
  end
end
