class CreateMemes < ActiveRecord::Migration[5.2]
  def change
    create_table :memes do |t|
      t.string :name
      t.text :author
      t.string :title
      t.string :text
      t.text :url
      t.text :permalink

      t.timestamps
    end
  end
end
