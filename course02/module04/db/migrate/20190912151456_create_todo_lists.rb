class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :list_name
      t.date :list_due_date
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
