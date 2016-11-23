class CreateImagePreviews < ActiveRecord::Migration[5.0]
  def change
    create_table :image_previews do |t|
      t.string :content

      t.timestamps
    end
  end
end
