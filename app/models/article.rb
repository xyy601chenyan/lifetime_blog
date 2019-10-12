class Article < ApplicationRecord
  #使用gem 'ranked-model' 添加排序功能
  include RankedModel
  ranks :row_order

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
