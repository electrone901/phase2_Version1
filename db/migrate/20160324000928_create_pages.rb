class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :total_visits
      t.integer :total_duration
      t.belongs_to :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
