class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :price, presence: true
  validates :author_id, uniqueness: { scope: :title }
end
