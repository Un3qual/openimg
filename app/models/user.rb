class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
  :rememberable, :trackable, :validatable

  validates :username, presence: true



  def email_required?
    false
  end

  def email_changed?
    false
  end
end
