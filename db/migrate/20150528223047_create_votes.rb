class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :users
  end
end
