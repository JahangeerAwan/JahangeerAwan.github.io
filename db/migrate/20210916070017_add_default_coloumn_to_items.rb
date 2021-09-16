class AddDefaultColoumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :status, :string, default: 'pending'
  end
end
