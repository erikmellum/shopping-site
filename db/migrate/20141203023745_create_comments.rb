class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.string :body
      t.datetime :date

      t.timestamps
    end
  end
end
