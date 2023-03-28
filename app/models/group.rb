class Group < ApplicationRecord
  has_one_attached :image
  belongs_to :owner, class_name: 'Customer'
  has_many :group_customers, dependent: :destroy

  validates :name, presence: true
  validates :introduction, presence: true

 def get_image
    (image.attached?) ? image : 'no_image.jpg'
 end

  def is_owned_by?(customer)
    owner.id == customer.id
  end
  
   def includesCustomer?(customer)
    group_customers.exists?(customer_id: customer.id)
   end
end

