class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :title
      t.string :abr
      t.string :process

      t.timestamps
    end
  end
end
