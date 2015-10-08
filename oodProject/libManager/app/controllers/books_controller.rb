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
      flag = 0 
      book = Book.find(params[:id])
      @user = User.where(:email => params[:isbn])
      @books=Book.all
      @books.each do|book|
       if (book.Lastuser == current_user.email)       
         flag = 1 
         flash[:notice] = 'You have another book checked out already' 
       end
      end
      if flag == 0   
        book = Book.find(params[:id])
        book.Status = !book.Status 
        book.Lastuser = current_user.email
        book.save
        History.create(:book_isbn => book.ISBN, :user_email => current_user.email, :book_title => book.Title, :book_author => book.Authors, :checkout_time => DateTime.now)
        flash[:notice] = 'Book was sucessfully checked out'           
      end 
     redirect_to book_path(book)      
  end

  # for notifying
  def notify
    flag4 = false
    @book = Book.find(params[:id])
    @user = current_user

    @notifications = Notification.all
    @notifications.each do |notif|
      if notif.ISBN == @book.ISBN
        if notif.email = @user.email
          flag4 = true
          break
        end
      end
    end
    if !flag4
      Notification.create(:ISBN => @book.ISBN, :email => @user.email)
      redirect_to book_path(@book)
      flash[:notice] = 'You will be notified via email when the book becomes available.'
    else
      flash[:notice] = 'You already subscribed to get a notification for this book.'
      redirect_to book_path(@book)
    end

  end

  # for checkout  on behalf of user and toggling book availability status
  def checkoutad
      flag = 0 
      flag2 = 0
      book = Book.find(params[:id])
      @user = User.where(:email => params[:email])
      @books=Book.all
      @books.each do|book|
       if (book.Lastuser == params[:email])       
         flag = 1 
         flash[:notice] = 'User has another book checked out already' 
       end
      end
      @users=User.all
      @users.each do|user|
       if (user.email == params[:email])       
         flag2 = 1
       end
      end
      if flag2 == 0   
        flash[:notice] = 'Invalid user email'
      end
      if ((flag == 0) && (flag2 == 1)) 
        book = Book.find(params[:id])
        book.Status = !book.Status 
        book.Lastuser = params[:email]
        book.save
        History.create(:book_isbn => book.ISBN, :user_email => params[:email], :book_title => book.Title, :book_author => book.Authors, :checkout_time => DateTime.now)
        flash[:notice] = 'Book was sucessfully checked out'           
      end 
     redirect_to book_path(book)      
  end

  # for displaying books to return
  def returnbook
    @books = Book.all       
  end

  # for return and toggling book availability status
  def returnit
    book = Book.find(params[:id])
    notify_subscribers(book)
    book.Status = !book.Status 
    book.Lastuser = nil
    book.save
    History.where(:book_isbn => book.ISBN).where(:return_time => nil).update_all( :return_time => DateTime.now)
    flash[:notice] = 'Book was sucessfully returned'
   redirect_to returnbook_path
  end

  def notify_subscribers(book)
    @notifications = Notification.all
    @notifications.each do |notif|
      if notif.ISBN == book.ISBN
        @user = User.find_by_email(notif.email)
        @book = Book.find_by_ISBN(notif.ISBN)
        #logger.debug "wassup #{@user}"
        #logger.debug "wassup #{@book.ISBN}"
        UserMailer.notification(@user, @book).deliver_now
        notif.destroy
      end
    end
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
    logger.debug "#{book_params}"
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
