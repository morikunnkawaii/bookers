class BooksController < ApplicationController

  def index
    @book = Book.new
    @books = Book.all  #テーブルに保存されたデータを全て取得
  end

  def create
    @book = Book.new(list_params)     #データ受け取り新規作成インスタンス作成
    if @book.save                        #データをデータベースに保存
      redirect_to book_path(@book.id)                  #showへ
      flash[:notice] = "Book was successfully created"  #フラッシュメッセージ redirect_toの上にするとなぜか投稿できなかった。上から処理されるうえで何か問題が生じるのだろう。
    else
      @books = Book.all                             #indexのインスタンス変数
      render :index, status: :unprocessable_entity  #indexへ
    end
  end
   



  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update                               #更新機能
    @book = Book.find(params[:id])
    if  @book.update(list_params)
        redirect_to book_path(@book.id)
        flash[:notice] = "Book was successfully created"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private #ストロングパラメータでセキュリティ強化
  def list_params
    params.require(:book).permit(:title, :body)
  end  
end
