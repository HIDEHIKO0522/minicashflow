class Flow < ApplicationRecord


  validates :income1, :income2, :income3, :income4, :income5, :income6, :income7, presence: true,
    numericality: {
      only_integer: true,
      more_than_or_equal_to: 0, 
      allow_blank: true
    } 
  validates :expense1, :expense2, :expense3, :expense4, :expense5, :expense6, :expense7, presence: true,
  numericality: {
    only_integer: true,
    more_than_or_equal_to: 0, 
    allow_blank: true
  }   
  
  validates :year_month_day, uniqueness: true

  before_save do
    self.income_total = ( income1 + income2 + income3 + income4 + income5 + income6 + income7 )
    self.expense_total = ( expense1 + expense2 + expense3 + expense4 + expense5 + expense6 + expense7 )
    
  end
end
