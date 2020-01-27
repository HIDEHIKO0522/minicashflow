class FlowsController < ApplicationController

  def index
  end
  
  def new
      @flow = Flow.new
  end
  
  def create
    @flow = Flow.create(flow_params)
    
    if @flow.save 
      flash.now[:alert] = '登録に成功しました。'
      render 'show' #成功の場合
    else   #失敗の場合
      flash.now[:alert] = '登録に失敗しました。'
      render 'new' 
    end 
  end     

  def show
    @flow = Flow.find(params[:id])
  end 


  private
  def flow_params
    params.require(:flow).permit(:year_month_day, :income1, :income2, :income3, :income4, :income5, :income6, :income7, :income_total,
                                 :expense1, :expense2, :expense3, :expense4, :expense5, :expense6, :expense7, :expense_total) 
  end  
end
