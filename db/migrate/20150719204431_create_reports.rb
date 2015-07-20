class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :type
      t.string :feed
      t.text :body

      t.timestamps null: false
    end
  end
end
