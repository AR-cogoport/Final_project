class Article < ApplicationRecord
  has_many :connect_tables, dependent: :destroy
  has_many :categorys, through: :connect_tables
  belongs_to :author
end
