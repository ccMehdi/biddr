class User < ActiveRecord::Base

  has_secure_password

  has_many :bids, dependent: :nullify

  validates :email_address, presence: true, uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def full_name
    "#{first_name} #{last_name}".strip
  end


end
