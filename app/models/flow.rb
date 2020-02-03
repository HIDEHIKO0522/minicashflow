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

  # scope :search, -> (search_params) do
  #   return if search_params.blank?
  #     year_month_day (search_params[:year_month_day ])
  #   end 
  #     scope :year_month_day, -> (year_month_day) { where(year_month_day: year_month_day ) if year_month_day.present? }

    # def self.search(search)
    #   if search
    #     Flow.where('year_month_day LIKE(?)', "%#{search}%")
    #   end
    #   Flow.all
    # end
end
