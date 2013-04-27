class Image < ActiveRecord::Base
  attr_accessible :data,
                  :product

  belongs_to :product

  has_attached_file :data, styles: { large: "400x", medium: "200x", thumb: "50x50#" }
  validates_attachment_size :data, :less_than => 2.megabytes

  def self.batch_create(params, product)
    params.each { |data| create(data: data, product: product) }
  end
end
