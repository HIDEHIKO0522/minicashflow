class FlowsController < ApplicationController

  def index
  end
  
  def new
      @flow = Flow.new
  end
  
  def create
    @flow = Flow.create

    if @flow.save 
      flash.now[:alert] = '登録に成功しました。'
      render 'show' #成功の場合
    else   #失敗の場合
      flash.now[:alert] = '登録に失敗しました。'
      render 'new' 
    end 
  end     

  def show

  end 

end
