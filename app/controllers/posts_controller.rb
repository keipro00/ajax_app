class PostsController < ApplicationController

  def index
    #新しいメモが一番上に表示されるように 
    # @posts = Post.all
    @posts = Post.all.order(id: "DESC")
  end

  # newアクションは不要
  # def new
  # end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index
  end
end
