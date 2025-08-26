class CreateLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :links do |t|
      t.string :short_link
      t.string :full_url

      t.timestamps
    end
  end
end
