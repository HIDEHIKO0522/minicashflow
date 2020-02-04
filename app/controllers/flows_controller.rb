class FlowsController < ApplicationController

  before_action :set_flow, only: [:edit, :show, :update]

  def index
    @q = Flow.ransack(params[:q])
    @flows = @q.result(distinct: true)
    @flows = Flow.order("year_month_day DESC").page(params[:page]).per(10)
  end  

  def new
      @flow = Flow.new
  end
  
  def create
    @flow = Flow.new(flow_params)
    
    if @flow.save 
      flash.now[:notice] = '登録に成功しました。'
      render 'show' #成功の場合
    else   #失敗の場合
      flash.now[:alert] = 'この日付には既にデータが登録されています。'
      render 'new' 
    end 
  end     

  def show
  end 

  def destroy
    flow = Flow.find(params[:id])
     if flow.destroy
      flash.now[:notice] = 'データを削除しました'
      render 'destroy'
     else
      flash.now[:alert] = 'データ削除に失敗しました'
      render 'show'
     end 
  end   

  def edit
  end  

  def update
    if @flow.update(flow_params)
      flash.now[:notice] = '編集に成功しました。'
      render 'show' 
    else
      render 'edit'
    end  
  end

  def report
    # 1月集計
    @from = Date.new(2020, 01 ,01)
    @to = Date.new(2020, 01 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_jan = @flows.sum(:income_total)
    @flow_expense_total_jan = @flows.sum(:expense_total)
    @flow_balance_total_jan = ( @flow_income_total_jan - @flow_expense_total_jan )
    @flow_carryover_jan = 1000000 + @flow_balance_total_jan

    # 2月集計
    @from = Date.new(2020, 02 ,01)
    @to = Date.new(2020, 02 ,29)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_feb = @flows.sum(:income_total)
    @flow_expense_total_feb = @flows.sum(:expense_total)
    @flow_balance_total_feb = ( @flow_income_total_feb - @flow_expense_total_feb )
    @flow_carryover_feb = @flow_carryover_jan + @flow_balance_total_feb

    # 3月集計
    @from = Date.new(2020, 03 ,01)
    @to = Date.new(2020, 03 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_mar = @flows.sum(:income_total)
    @flow_expense_total_mar = @flows.sum(:expense_total)
    @flow_balance_total_mar = ( @flow_income_total_mar - @flow_expense_total_mar )
    @flow_carryover_mar = @flow_carryover_feb + @flow_balance_total_mar

    # 4月集計
    @from = Date.new(2020, 04 ,01)
    @to = Date.new(2020, 04 ,30)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_apr = @flows.sum(:income_total)
    @flow_expense_total_apr = @flows.sum(:expense_total)
    @flow_balance_total_apr = ( @flow_income_total_apr - @flow_expense_total_apr )
    @flow_carryover_apr = @flow_carryover_mar + @flow_balance_total_apr   
 
    # 5月集計
    @from = Date.new(2020, 05 ,01)
    @to = Date.new(2020, 05 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_may = @flows.sum(:income_total)
    @flow_expense_total_may = @flows.sum(:expense_total)
    @flow_balance_total_may = ( @flow_income_total_may - @flow_expense_total_may )
    @flow_carryover_may = @flow_carryover_apr + @flow_balance_total_may   

    # 6月集計
    @from = Date.new(2020, 06 ,01)
    @to = Date.new(2020, 06 ,30)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_jun = @flows.sum(:income_total)
    @flow_expense_total_jun = @flows.sum(:expense_total)
    @flow_balance_total_jun = ( @flow_income_total_jun - @flow_expense_total_jun )
    @flow_carryover_jun = @flow_carryover_may + @flow_balance_total_jun   

    # 7月集計
    @from = Date.new(2020, 07 ,01)
    @to = Date.new(2020, 07 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_jul = @flows.sum(:income_total)
    @flow_expense_total_jul = @flows.sum(:expense_total)
    @flow_balance_total_jul = ( @flow_income_total_jul - @flow_expense_total_jul )
    @flow_carryover_jul = @flow_carryover_jun + @flow_balance_total_jul   

    # 8月集計
    @from = Date.new(2020, 8 ,01)
    @to = Date.new(2020, 8 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_aug = @flows.sum(:income_total)
    @flow_expense_total_aug = @flows.sum(:expense_total)
    @flow_balance_total_aug = ( @flow_income_total_aug - @flow_expense_total_aug )
    @flow_carryover_aug = @flow_carryover_jul + @flow_balance_total_aug

    # 9月集計
    @from = Date.new(2020, 9 ,01)
    @to = Date.new(2020, 9 ,30)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_sep = @flows.sum(:income_total)
    @flow_expense_total_sep = @flows.sum(:expense_total)
    @flow_balance_total_sep = ( @flow_income_total_sep - @flow_expense_total_sep )
    @flow_carryover_sep = @flow_carryover_aug + @flow_balance_total_sep

    # 10月集計
    @from = Date.new(2020, 10 ,01)
    @to = Date.new(2020, 10 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_oct = @flows.sum(:income_total)
    @flow_expense_total_oct = @flows.sum(:expense_total)
    @flow_balance_total_oct = ( @flow_income_total_oct - @flow_expense_total_oct )
    @flow_carryover_oct = @flow_carryover_sep + @flow_balance_total_oct

    # 11月集計
    @from = Date.new(2020, 11 ,01)
    @to = Date.new(2020, 11 ,30)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_nov = @flows.sum(:income_total)
    @flow_expense_total_nov = @flows.sum(:expense_total)
    @flow_balance_total_nov = ( @flow_income_total_nov - @flow_expense_total_nov )
    @flow_carryover_nov = @flow_carryover_oct + @flow_balance_total_nov

    # 12月集計
    @from = Date.new(2020, 12 ,01)
    @to = Date.new(2020, 12 ,31)
    @flows = Flow.where(year_month_day: @from..@to)
    @flow_income_total_dec = @flows.sum(:income_total)
    @flow_expense_total_dec = @flows.sum(:expense_total)
    @flow_balance_total_dec = ( @flow_income_total_dec - @flow_expense_total_dec )
    @flow_carryover_dec = @flow_carryover_nov + @flow_balance_total_dec 
  
    gon.data_income = [ @flow_income_total_jan, 
                        @flow_income_total_feb,
                        @flow_income_total_mar,
                        @flow_income_total_apr,
                        @flow_income_total_may,
                        @flow_income_total_jun,
                        @flow_income_total_jul,
                        @flow_income_total_aug,
                        @flow_income_total_sep,
                        @flow_income_total_oct,
                        @flow_income_total_nov,
                        @flow_income_total_dec ]
                        
    12.times do
      gon.data_income << rand(100.0)
    end  
    
      gon.data_expense = [ @flow_expense_total_jan, 
                           @flow_expense_total_feb,
                           @flow_expense_total_mar,
                           @flow_expense_total_apr,
                           @flow_expense_total_may,
                           @flow_expense_total_jun,
                           @flow_expense_total_jul,
                           @flow_expense_total_aug,
                           @flow_expense_total_sep,
                           @flow_expense_total_oct,
                           @flow_expense_total_nov,
                           @flow_expense_total_dec ]
    12.times do
      gon.data_expense << rand(100.0)
    end  

    gon.data_carryover = [ @flow_carryover_jan, 
                           @flow_carryover_feb,
                           @flow_carryover_mar,
                           @flow_carryover_apr,
                           @flow_carryover_may,
                           @flow_carryover_jun,
                           @flow_carryover_jul,
                           @flow_carryover_aug,
                           @flow_carryover_sep,
                           @flow_carryover_oct,
                           @flow_carryover_nov,
                           @flow_carryover_dec ]
    12.times do
      gon.data_income << rand(100.0)
    end  
  end  


  def set_flow #showとedit,#updateでの処理
    @flow = Flow.find(params[:id]) 
  end

  private
  def flow_params
    params.require(:flow).permit(:year_month_day, :income1, :income2, :income3, :income4, :income5, :income6, :income7, :income_total,
                                 :expense1, :expense2, :expense3, :expense4, :expense5, :expense6, :expense7, :expense_total) 
  end  
end
