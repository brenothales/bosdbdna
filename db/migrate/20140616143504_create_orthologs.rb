class CreateOrthologs < ActiveRecord::Migration
  def change
    create_table :orthologs do |t|
      t.string :group_id
      t.string :protein_id
      t.string :organism_name
      t.string :protein_description
      t.text :sequence
      t.string :group_description
      t.string :source_db

      t.timestamps
    end
  end
end
