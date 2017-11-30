class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :street, :price, :city, :zip, :state,
             :beds, :baths, :sq__ft, :type,
             :sale_date, :latitude, :longitude
end
