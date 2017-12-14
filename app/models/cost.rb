class Cost < ApplicationRecord
  has_many :opportunities

  def to_s
    name
  end
end
