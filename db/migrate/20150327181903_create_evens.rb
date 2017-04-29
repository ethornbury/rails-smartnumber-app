class CreateEvens < ActiveRecord::Migration
  def change
    create_table :evens do |t|
      t.integer :number

      t.timestamps
    end
  end
end
