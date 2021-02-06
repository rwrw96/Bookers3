class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @booker = Book.new
  end

  def create
    books = Book.new(books_params)
    if books.save
      redirect_to book_path(books.id)
      flash[:notice] = "Book was successfully created."
    else
      flash[:notice] = "error"
      redirect_to books_path
    end
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    books = Book.find(params[:id])
    books.update(books_params)
    redirect_to book_path(books)
  end

  def destroy
    books = Book.find(params[:id])
    books.destroy
    redirect_to "/books"
  end

  private
  def books_params
    params.permit(:title, :body)
  end
end

