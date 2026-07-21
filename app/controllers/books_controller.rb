class BooksController < ApplicationController
  def new
    @book = Book.new <!-- インスタンス変数 -->
  end

  def create
    book = Book.new(list_params)


  def index
  end

  def show
  end

  def edit
  end
end
