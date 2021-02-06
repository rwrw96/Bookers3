class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
  end

  def new
    @book = Book.new(books_params)
  end

  def create
    books = Book.new(title: params[:title], body: params[:body])
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
     if books.update(books_params)
      redirect_to book_path(books.id)
      flash[:notice] = "Book was successfully created."
     else
      flash[:notice] = "error"
      redirect_to edit_book_path
     end
  end

  def destroy
    books = Book.find(params[:id])
    if books.destroy
    redirect_to "/books"
    flash[:notice] = "Book was successfully created."
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end

