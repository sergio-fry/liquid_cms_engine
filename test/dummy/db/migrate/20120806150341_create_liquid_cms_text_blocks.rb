class CreateLiquidCmsTextBlocks < ActiveRecord::Migration
  def change
    create_table :liquid_cms_text_blocks do |t|
      t.string :key
      t.text :body

      t.timestamps
    end

    add_index :liquid_cms_text_blocks, :key, :unique => true
  end
end
