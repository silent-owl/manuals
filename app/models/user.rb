class User < ApplicationRecord
  has_many :manuals, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:vkontakte]
  def self.vkontakte_from_omniauth(auth) 
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user| 
    user.provider = auth.provider 
    user.uid = auth.uid 
    user.email = auth.info.first_name + '_' + auth.info.last_name + '@vk.com' 
    user.name = auth.info.first_name 
    user.surname = auth.info.last_name 
    user.password = Devise.friendly_token[0,20] 
    # user.image = auth.info.image 
    user.save 
    end 
  end      
end
