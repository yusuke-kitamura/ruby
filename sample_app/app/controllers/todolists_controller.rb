class TodolistsController < ApplicationController
  def new
  	@list = List.new
  end

  # 以下を追加
  def create
        # ストロングパラメーターを使用
         list = List.new(list_params)
        # DBへ保存する
         list.save
        # トップ画面へリダイレクト
        redirect_to '/top'
    end
    private
   
    def list_params
        params.require(:list).permit(:title, :body)
    end
end
