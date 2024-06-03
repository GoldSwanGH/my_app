class User < ApplicationRecord
    has_many :values, dependent: :destroy
    before_save { self.email = email.downcase }

    # validates :name, presence: true, uniqueness: true, length: { maximum: 50 }

    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    # validates :email, presence: true,
    #         uniqueness: { case_sensitive: false },
    #         format: { with: VALID_EMAIL_REGEX }

    has_secure_password

    validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }#, allow_nil: true

end
