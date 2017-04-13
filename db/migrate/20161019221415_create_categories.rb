class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.references  :parent,      null: true,     default: nil, index: true, foreign_key: {to_table: :categories}
      t.string      :caption,     null: false,    default: "default_category_caption"
      t.integer     :order,       null: false,    default: 0

      t.timestamps
    end
  end
end
