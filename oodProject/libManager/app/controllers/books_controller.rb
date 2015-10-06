class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]


  # GET /books
  # GET /books.json
  def index
    #@books = Book.all
  end

  #for obtaining complete list of books
  def full
    @books = Book.all
  end

  #for displaying book searched via ISBN
  def fullsearch
    if params[:isbn]
      @books = Book.where(:ISBN => params[:isbn])
    elsif params[:title]
      @books = Book.where("Title LIKE :title1", { :title1 => "#{params[:title]}%"})
    elsif params[:author]
      @books = Book.where("Authors LIKE :author1", { :author1 => "#{params[:author]}%"})
    elsif params[:description]
      @books = Book.where("Description LIKE :description1", { :description1 => "#{params[:description]}%"})
    else
      @books = Book.all
    end
  end

  #for obtaining only books that are currently available for checkout
  def available
    @books = Book.all
  end

  # for checkout and toggling book availability status
  def checkout
    book = Book.find(params[:id])
    book.Status = !book.Status
    book.save

    redirect_to book_path(book)
  end

  #for searching books via ISBN
  def searchisbn
  end

  #for searching books via Title
  def searchtitle
  end

  #for searching books via Author
  def searchauthor
  end

  #for searching books via description
  def searchdescription
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:ISBN, :Title, :Authors, :Description, :Status, :Lastuser, :Datetime)
  end
end
