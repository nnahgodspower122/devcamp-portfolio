class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :title
      t.string :percent_utilized
      t.string :integer

      t.timestamps
    end
  end
end
