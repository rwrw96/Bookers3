class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
 
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(books_params)
      redirect_to book_path(@book.id) , notice:"Book was successfully created."
     else
       render :edit
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

