class Article < ApplicationRecord
  STATUS = ["draft","public","private"].freeze
  validates_presence_of :title,:description
  validates_uniqueness_of :token
  validates_inclusion_of :status, in: STATUS

  before_create :generate_token

  belongs_to :user

  scope :published, -> {where(status: "public")}

  def generate_token
    self.token = SecureRandom.uuid
  end
end
