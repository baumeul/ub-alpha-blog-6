class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 4096 }
  validates :created_by, presence: true, length: {minimum: 3, maximum: 50}
  validates :updated_by, presence: true, length: {minimum: 3, maximum: 50}
end
