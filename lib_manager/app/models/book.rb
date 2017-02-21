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

  mount_uploader :picture, PictureBook

  validates :book_numbers, presence: true
  validates :name, presence: true
  validates :number_of_pages, presence: true
  validates :languages, presence: true
  validate  :picture_size

  private
  def picture_size
    if picture.size > 3.megabytes
      errors.add :picture, t("books.new-page.over-size")
    end
  end
end
