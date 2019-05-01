class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :post_users, dependent: :destroy
  has_many :attended_posts, through: :post_users, source: :post
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
  
  # 受講する
  def attend(post)
    attended_posts << post
  end

  # 受講を取りやめる
  def unfollow(other_user)
    attended_posts.find_by(user_id: other_user.id).destroy
  end

  # 現在のユーザーが受講していたらtrueを返す
  def attend?(post)
    attended_posts.include?(post)
  end

end
