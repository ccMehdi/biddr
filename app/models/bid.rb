class Bid < ActiveRecord::Base

  belongs_to :user
  belongs_to :item

  validates :bid_amount, presence: true
  default_scope { order("created_at DESC") }

end
