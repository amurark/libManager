class UserMailer < ApplicationMailer
  default from: "thelibrarian2015@gmail.com"
  def notification(user, book)
    @greeting = "Hi #{user.name}"
    @url = "https://sleepy-sierra-6887.herokuapp.com/"
    @user = user
    @book = book
    @email = @user.email
    mail to: @email, subject: "Notification from the librarian"
  end
end
