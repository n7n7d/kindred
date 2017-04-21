class House < ApplicationRecord
  belongs_to :seller
  has_many :photos, dependent: :destroy
end
