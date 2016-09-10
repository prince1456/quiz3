class User < ApplicationRecord
    has_secure_password
    # after_initialize :set_defaults

  has_many :ideas, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post


  has_many :memberships, dependent: :destroy
  has_many :ideas, through: :memberships




    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence:   true,
                      uniqueness: {case_sensitive: false},
                      format:     VALID_EMAIL_REGEX


  def full_name
    "#{first_name} #{last_name}".squeeze(" ").strip.titleize
  end


  # private
  #
  # def set_defaults
  #   self.admin ||= false
  # end


end
