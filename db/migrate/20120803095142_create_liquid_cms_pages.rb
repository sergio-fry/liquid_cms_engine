class CreateLiquidCmsPages < ActiveRecord::Migration
  def change
    create_table :liquid_cms_pages do |t|
      t.string :slug
      t.string :title
      t.text :body

      t.timestamps
    end

    add_index :liquid_cms_pages, :slug, :unique => true
  end
end
