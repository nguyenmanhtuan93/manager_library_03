class Book < ApplicationRecord
  has_many :borrows
  has_many :comments

  has_many :relationships, as: :targetable
  has_many :users, through: :relationships,
    source_type: User.name, source: :ownerable
  has_many :categories, through: :relationships,
    source_type: Category.name, source: :ownerable
  has_many :authors, through: :relationships,
    source_type: Author.name, source: :ownerable

  belongs_to :publisher

  validates :name, presence: true
  validates :number_of_pages, presence: true
  validates :year, presence: true
  validates :book_numbers, presence: true
  validates :languages, presence: true
end
