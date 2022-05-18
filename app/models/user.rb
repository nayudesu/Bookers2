class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books, dependent: :destroy
  
  has_one_attached :profile_image
  
  validates :name,{presence: true,length: { in: 2..20 }} #２〜２０文字
  validates :introduction,{presence: true, lengh: {maximum: 150}}#最大２００字まで,{}追加？

  
  def get_profile_image(width, height) #profile_imageという名前でActiveStorageでプロ画像を保存できるように
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
