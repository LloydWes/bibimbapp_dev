class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, omniauth_providers: [:facebook, :google_oauth2, :twitter]


  has_many :results
  belongs_to :level, optional: true

  validates :email, presence: true, allow_nil: false
  validates :first_name, presence: true, allow_nil: false
  validates :last_name, presence: true, allow_nil: false
  validates :date_of_birth, presence: true, allow_nil: false
  validates :gender, presence: true, allow_nil: false, inclusion: {in: %w(female male), message: "%{attribute} must be female or male"}
  validates :is_admin?, inclusion: {in: [false, true], message: "%{attribute} must be true or false"}
  # validates :level_id, presence: true, allow_nil: false#,inclusion: {in: Level.all.ids, message: "%{attribute} must be A1 A2 B1 B2 or #{Level.all.ids}"}

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do | user |
      user.email = provider_data.info.email
      user.first_name = provider_data.info.first_name
      user.last_name = provider_data.info.last_name
      user.gender = provider_data.info.gender
      user.is_admin = provider_data.info.is_admin
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end

end
