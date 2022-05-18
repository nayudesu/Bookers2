class Book < ApplicationRecord
  
  belongs_to :user
  
  validates :title,presence: true
  validates :opinion,presence: true, lengh: {maximum: 200}#最大２００字まで,{}追加
  
end
