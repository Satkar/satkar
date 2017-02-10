class AddForSaleToAlbum < ActiveRecord::Migration
  def change
  	add_column :albums, :for_sale, :boolean, default: true
  end
end
