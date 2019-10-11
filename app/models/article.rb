class Article < ApplicationRecord
  validates_presence_of :title,:description
  validates_uniqueness_of :token

  before_create :generate_token

  belongs_to :user

  def generate_token
    self.token = SecureRandom.uuid
  end
end
