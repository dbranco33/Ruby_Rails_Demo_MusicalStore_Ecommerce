class AddHstToProvinces < ActiveRecord::Migration[5.0]
  def change
    add_column :provinces, :hst, :decimal
  end
end
