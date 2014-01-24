class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :description
      t.references :post, index: true

      t.timestamps
    end
  end
end
