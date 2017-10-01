class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :post, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  before_save :default_role
	def default_role
		self.role ||= 0
	end
end
