class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :mobile, :description, :pincode
end
