class Flows::SearchesController < ApplicationController

  def index
    @q = Flow.ransack(params[:q])
    @flow_search = @q.result(distinct: true)
        flash[:alert] = 'この日付にデータは登録されていません'
        redirect_to flows_path    
      else

      end  
  end

  private
  def search_params
    params.require(:q).permit(:year_mpnth_day_eq)
  end
  
end
