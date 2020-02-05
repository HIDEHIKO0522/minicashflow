class AddTextToFlows < ActiveRecord::Migration[5.2]
  def change
    add_column :flows, :text, :string
  end
end
