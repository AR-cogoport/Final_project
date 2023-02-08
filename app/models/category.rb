class Category < ApplicationRecord

  has_many :connect_tables, dependent: :destroy
  has_many :articles, through: :connect_tables

  validates :text, presence: true
end
