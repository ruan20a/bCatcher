class AddColumnSource < ActiveRecord::Migration
  def change
    add_column :items, :source_url, :string
  end
end


