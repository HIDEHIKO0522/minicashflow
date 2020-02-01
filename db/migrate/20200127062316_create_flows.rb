class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.date :year_month_day,     null: false
      t.integer :income1,        default: "0"
      t.integer :income2,        default: "0"
      t.integer :income3,        default: "0"
      t.integer :income4,        default: "0"
      t.integer :income5,        default: "0"
      t.integer :income6,        default: "0"
      t.integer :income7,        default: "0"
      t.integer :income_total,   null: false
      t.integer :expense1,       default: "0"
      t.integer :expense2,       default: "0"
      t.integer :expense3,       default: "0"
      t.integer :expense4,       default: "0"
      t.integer :expense5,       default: "0"
      t.integer :expense6,       default: "0"
      t.integer :expense7,       default: "0"
      t.integer :expense8,       default: "0"
      t.integer :expense_total,  null: false
      t.timestamps
      
    end
    add_index :flows, :year_month_day,    unique: true
  end
end
