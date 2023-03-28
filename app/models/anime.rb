class Anime < ApplicationRecord
   belongs_to :customer, optional: true
  has_many :anime_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image
  
  
  validates :title, presence: true
  validates :body, presence: true
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
   def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
   end
end

