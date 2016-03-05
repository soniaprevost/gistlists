class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :author
      t.string :link
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
