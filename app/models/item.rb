class Item < ActiveRecord::Base

  belongs_to :user

  has_many :bids, dependent: :destroy

  validates :title,     presence: true
  validates :detail,    presence: true
  validates :end_date,  presence: true

  

end
