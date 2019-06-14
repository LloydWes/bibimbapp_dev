class User < ApplicationRecord
  after_create :welcome_send
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :results
  belongs_to :level, optional: true
  has_one_attached :avatar

  validates :email, presence: true, allow_nil: false
  validates :first_name, presence: true, allow_nil: false
  validates :last_name, presence: true, allow_nil: false
  # validates :date_of_birth, presence: true, allow_nil: false
  validates :gender, presence: true, allow_nil: false, inclusion: {in: %w(female male), message: "%{attribute} must be female or male"}
  validates :is_admin?, inclusion: {in: [false, true], message: "%{attribute} must be true or false"}
  # validates :level_id, presence: true, allow_nil: false#,inclusion: {in: Level.all.ids, message: "%{attribute} must be A1 A2 B1 B2 or #{Level.all.ids}"}
  # validates_date :date_of_birth, on_or_before: lambda { Date.current }, :message => "%{attribute} must be before today"


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
