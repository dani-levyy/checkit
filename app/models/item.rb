class Item < ApplicationRecord
  belongs_to :user

  # Item::CATEGORIES => Call this ANYWHERE in the app
  CATEGORIES = %w(Fruit Veg Beans Pasta Protein Soup)
  validates :name, :purchased, :expires, :category, presence: true
  validates :category, inclusion: { in: CATEGORIES }

  include PgSearch::Model
   pg_search_scope :search_by_category_and_name,
    against: [ :category, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
