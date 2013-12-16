class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.string :image_url
      t.decimal :price, :precision => 2
      t.decimal :sale_price, :precision => 2
      t.decimal :required_price, :precision => 2
      t.string :size
      t.string :color
      t.text :notes
      t.boolean :is_change, :default => false
      t.boolean :is_private, :default => false
      t.timestamps
    end
  end
end
