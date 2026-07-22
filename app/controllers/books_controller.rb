class BooksController < ApplicationController
  def new
    @book = Book.new 
  end

  def create
    book = Book.new(list_params)     #データ受け取り新規作成インスタンス作成
    book.save                        #データをデータベースに保存
    redirect_to root_path                  #top画面へ
  end
   

  def index
    @books = Book.all  #テーブルに保存されたデータを全て取得
  end

  def show
  end

  def edit
  end

  private #ストロングパラメータでセキュリティ強化
  def list_params
    params.require(:book).permit(:title, :body)
  end  
end
