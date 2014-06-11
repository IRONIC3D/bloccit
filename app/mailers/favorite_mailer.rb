class FavoriteMailer < ActionMailer::Base
  default from: "i3d@ironic3d.com"

  def new_comment(user, post, comment)
    @user = user
    @post = post
    @comment = comment

    headers["Message-ID"] = "<comments/#{@comment.id}@iyad-bloccit.herokuapp.com>"
    headers["In-Reply-To"] = "<post/#{@post.id}@iyad-bloccit.herokuapp.com>"
    headers["References"] = "<post/#{@post.id}@iyad-bloccit.herokuapp.com>"

    mail(to: user.email, subject: "New comment on #{post.title}")
  end
end
