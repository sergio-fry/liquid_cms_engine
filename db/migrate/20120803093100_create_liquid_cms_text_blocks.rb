class CreateLiquidCmsTextBlocks < ActiveRecord::Migration
  def change
    create_table :liquid_cms_text_blocks do |t|
      t.string :key
      t.text :body

      t.timestamps
    end
  end
end
