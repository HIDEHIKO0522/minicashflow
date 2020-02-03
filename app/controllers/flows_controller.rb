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

  def set_flow #showとedit,#updateでの処理
    @flow = Flow.find(params[:id]) 
  end

  private
  def flow_params
    params.require(:flow).permit(:year_month_day, :income1, :income2, :income3, :income4, :income5, :income6, :income7, :income_total,
                                 :expense1, :expense2, :expense3, :expense4, :expense5, :expense6, :expense7, :expense_total) 
  end  
end
