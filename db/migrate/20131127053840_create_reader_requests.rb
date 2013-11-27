class CreateReaderRequests < ActiveRecord::Migration
  def change
    create_table :reader_requests do |t|
      t.integer :requester, :references => :user
      t.boolean :responded
      t.string :time_stamp

      t.timestamps
    end
  end
end
