class BakedGood < ActiveRecord::Base
  belongs_to :bakery

  def self.ordered_goods
    self.order(:price).reverse
  end

end
