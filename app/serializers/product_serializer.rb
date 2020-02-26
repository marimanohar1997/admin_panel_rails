class ProductSerializer < ActiveModel::Serializer
  attributes :id,:name,:brand,:quantity, :price, :size, :discount, :stock, :selling_price, :color, :gender, :specification, :category

end
