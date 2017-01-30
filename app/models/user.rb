class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
  :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }, 
  :format => { with: /\A[a-zA-Z0-9\_]+\Z/, :message => 'can only have letters, numbers, and underscores.' }

  has_many :images

  self.primary_key = 'id'

  # Generate random base36 id before creation
  before_create :generate_id, if: :id_blank?

  def generate_id
    self.id = SecureRandom.hex(15).to_i(16).to_s(36)
    #retry if not unique
    generate_id unless Image.where(id: self.id).blank?
  end

  def id_blank?
    id.blank?
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def count_images
    3
    #Image.where(:user_id => self.id).count
  end
end
