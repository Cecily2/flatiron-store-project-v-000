class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.string "status", default: "not submitted"
    end
    add_foreign_key :carts, :users    

  end
end
