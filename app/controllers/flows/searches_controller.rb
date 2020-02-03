class Flows::SearchesController < ApplicationController

  def index
    @flows_search = Flow.order("year_month_day DESC").page(params[:page]).per(10)
  end  



  
end
