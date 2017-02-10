class Relationship < ApplicationRecord
  belongs_to :ownerable, polymorphic: true
  belongs_to :targetable, polymorphic: true

  validates :ownerable_id, presence: true
  validates :targetable_id, presence: true
end
