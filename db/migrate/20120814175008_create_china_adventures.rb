class CreateChinaAdventures < ActiveRecord::Migration
  def change
    create_table :china_adventures do |t|
      t.date :date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
