class Item < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
   pg_search_scope :search_by_category_and_name,
    against: [ :category, :name ],
    using: {
      tsearch: { prefix: true }
    }
end
