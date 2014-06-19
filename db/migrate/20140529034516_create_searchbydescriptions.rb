class CreateSearchbydescriptions < ActiveRecord::Migration
  def change
    create_table :searchbydescriptions do |t|

      t.timestamps
    end
  end
end
