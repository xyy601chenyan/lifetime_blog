class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # 删除:registerable模块，以取消注册功能
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable

  has_many :articles
end
