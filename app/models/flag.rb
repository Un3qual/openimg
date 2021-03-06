class Flag < ApplicationRecord
  belongs_to :user
  belongs_to :image

  self.primary_key = 'id'

  # Generate random base36 id before creation
  before_create :generate_id, if: :id_blank?

  def generate_id
    self.id = SecureRandom.hex(16).to_i(16).to_s(36)
    #retry if not unique
    generate_id unless Image.where(id: self.id).blank?
  end

  def id_blank?
    id.blank?
  end
end
