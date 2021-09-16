class AddDefaultColoumnToTodolist < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :status, :string, default: 'pending'
  end
end
