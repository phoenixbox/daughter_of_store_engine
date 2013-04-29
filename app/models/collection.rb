class Collection < ActiveRecord::Base
  attr_accessible :name,
                  :theme,
                  :user_id

  belongs_to :user
  has_and_belongs_to_many :products

  validates :name, presence: true
  validates :theme, presence: true
  validates :user_id, presence: true

  def add_product(product_id)
    product = Product.find(product_id)
    self.products << product
  end

  def remove_product(product_id)
    product = Product.find(product_id)
    self.products.destroy(product)
  end
end
