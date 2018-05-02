class AddGossipColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :gossip_id, :integer
  end
end
