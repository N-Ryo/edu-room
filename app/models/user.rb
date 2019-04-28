class User < ApplicationRecord
  has_many :active_messages, class_name:  "Message",
                                  foreign_key: "teacher_id",
                                  dependent:   :destroy
  has_many :students, through: :active_messages
  has_many :passive_messages, class_name:  "Message",
                                  foreign_key: "student_id",
                                  dependent:   :destroy
  has_many :teachers, through: :passive_messages
  has_many :post_users
  has_many :attended_posts, through: :post_users, source: :posts
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
