class Article < ApplicationRecord
  validates_presence_of :title,:description
  validates_uniqueness_of :token

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end
end
