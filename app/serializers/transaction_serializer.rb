class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :street, :price, :city, :zip, :state,
             :beds, :baths, :sq__ft, :category,
             :sale_date, :latitude, :longitude
end
