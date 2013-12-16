class ChangeColumnPrecision < ActiveRecord::Migration
  def change
    remove_column :items, :price
    remove_column :items, :sale_price
    remove_column :items, :required_price
    add_column :items, :price, :decimal, :precision => 8, :scale => 2
    add_column :items, :required_price, :decimal, :precision => 8, :scale => 2
    add_column :items, :sale_price, :decimal, :precision => 8, :scale => 2
  end
end
