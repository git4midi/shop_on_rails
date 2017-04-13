class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string    :user_name,         null: false, default: "default_user_name"
      t.integer   :joomla_user_id,    null: false
      t.datetime  :show_items_until,  null: false, default: DateTime.new(2001, 1, 1, 0, 0, 0)
      t.timestamps
    end
  end
end
