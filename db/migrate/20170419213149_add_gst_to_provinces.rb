class AddGstToProvinces < ActiveRecord::Migration[5.0]
  def change
    add_column :provinces, :gst, :decimal
  end
end
