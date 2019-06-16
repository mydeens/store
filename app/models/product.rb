class Product < ApplicationRecord
  attr_accessor :new_category_name
  before_save :create_category_from_name
  has_one_attached :image
  has_one_attached :document
  belongs_to :category, required: false
  has_many :order_items

  validates :name, :description, :price, :stock, presence: true
  validates :category, presence: true, if: -> { new_category_name.blank? }
  def create_category_from_name
    create_category(name: new_category_name) unless new_category_name.blank?
  end
end
