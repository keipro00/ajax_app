# class PostsController < ApplicationController

#   def index
#     #新しいメモが一番上に表示されるように 
#     # @posts = Post.all
#     @posts = Post.all.order(id: "DESC")
#   end

#   # newアクションは不要
#   # def new
#   # end

#   def create
#     Post.create(content: params[:content])
#     redirect_to action: :index
#   end

#   # checkedアクションを定義、既読の操作を行った際に実行されるアクション
#   def checked
# binding.pry
#     post = Post.find(params[:id])
#     if post.checked 
#       post.update(checked: false)
#     else
#       post.update(checked: true)
#     end

#     item = Post.find(params[:id])
#     render json: { post: item }
#   end
# end

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end
  def create
    # Post.create(content: params[:content])
    # redirect_to action: :index
    # レスポンスをJSONへ変更
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post }
  end
  def checked
    
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end
    item = Post.find(params[:id])
    render json: { post: item }
  end

end