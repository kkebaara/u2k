class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  attr_accessor :login

  after_create :send_welcome_email
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
    UserMailer.hq_email_upon_signup(self).deliver
  end

  #->Prelang (user_login:devise/username_login_support)
  has_many :orders, dependent: :destroy
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
    else
      where(conditions).first
    end
  end

  validates_uniqueness_of :email, :allow_blank => false
  validates_uniqueness_of :mobile, :allow_blank => true
  validates_uniqueness_of :pp_id, :allow_blank => true
  validates_uniqueness_of :address, :allow_blank => true
  validates_acceptance_of :terms

 # email upon:
  # 1) User account creation (tell them to fill out their shit)
  # 2) User account update
  # 3) User account information missing (after X amount of time)
  #    hold off on this one for now, maybe do it manually later
  # X) For now, manually email upon account deletion,
  #   since you'll have to manually delete the account anyways

  devise authentication_keys: [:login]
end
