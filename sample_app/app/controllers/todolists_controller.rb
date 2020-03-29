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

    def index
    	@lists = List.all
    end

    def show
    	@list = List.find(params[:id])
    end

    def create
        list = List.new(list_params)
        list.save # データベースへ保存する
  
        redirect_to todolist_path(list.id) # 詳細画面へリダイレクト
    end

    def edit
    	@list = List.find(params[:id])
    end

    def update
    	list = List.find(params[:id])
        list.update(list_params)
        redirect_to todolist_path(list.id)
    end

    def destroy
    	list = List.find(params[:id])
    	# データを1件取得
    	list.destroy
    	# データを削除
    	redirect_to todolists_path
    	# List一覧画面へリダイレクト
    end



    private
   
    def list_params
        params.require(:list).permit(:title, :body, :image)
    end
end
