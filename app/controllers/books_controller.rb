class BooksController < ApplicationController
  def new
    @book = List.new 
  end

  def create
    book = List.new(list_params)     #データ受け取り新規作成インスタンス作成
    book.save                    <!-- データをデータベースに保存 -->
    redirect_to '/'                 #top画面へ
  end
   

  def index
  end

  def show
  end

  def edit
  end

  private #ストロングパラメータでセキュリティ強化
  def list_params
    params.require(:book).permit(:title, :body)
end
