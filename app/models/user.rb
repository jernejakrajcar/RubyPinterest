class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :pins, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_one_attached :avatar
  acts_as_commontator

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates_uniqueness_of :name

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       if(auth.info.email?)
         user.email = auth.info.email
       else
         user.email = "test@test.si"
       end

       if(auth.info.name?)
         user.name = auth.info.name
       else
         user.name = "anonimous"
       end

       user.password = Devise.friendly_token[0, 20]

     end
   end

     def self.new_with_session(params, session)
       super.tap do |user|
         if data = session["devise.facebook"] && session["devise.facebook_data"]["extra"]["raw_info"]
           user.email = data["email"] if user.email.blank?
         end
         if data = session["devise.google_oauth2"] && session["devise.google_oauth2_data"]["extra"]["raw_info"]
           user.email = data["email"] if user.email.blank?
         end
       end
     end

 end
