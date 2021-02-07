class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
  
  end

  def create
    book = Book.new(title: params[:title], body: params[:body])
    if book.save
      redirect_to book_path(book.id)
      flash[:notice] = "Book was successfully created."
    else
      flash[:notice] ="error"
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
     if book.update(books_params)
      redirect_to book_path(book.id) , notice:"Book was successfully created."
     else
      redirect_to edit_book_path , notice:"error"
     end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
    redirect_to "/books" , notice:"Book was successfully created."
    end
  end

  private
  def books_params
    params.require(:book).permit(:title, :body)
  end
end

