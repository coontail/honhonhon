class CreateContents < ActiveRecord::Migration

  def change
    create_table :contents do |t|
      t.text :body
      t.string :title
      t.string :uuid
      t.timestamps null: false
    end

    add_index :contents, :uuid
  end

end
