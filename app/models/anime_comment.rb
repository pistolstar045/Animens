class AnimeComment < ApplicationRecord
  belongs_to :customer
  belongs_to :anime
    
  validates :comment, presence: true
end

