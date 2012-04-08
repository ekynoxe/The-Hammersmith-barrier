class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.boolean :status, :null => false, :default => false
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
