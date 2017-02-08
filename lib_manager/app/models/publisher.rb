class Publisher < ApplicationRecord
  has_many :books
  has_many :authors

  before_save :downcase_email
end
