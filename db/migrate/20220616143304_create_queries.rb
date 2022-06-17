class CreateQueries < ActiveRecord::Migration[6.1]
  def change
    create_table :queries do |t|
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
