class RenameItemsColumns < ActiveRecord::Migration
  def change
    rename_column :items, :sale_price, :current_price
  end
end
