class PostsController < ApplicationController

  def index
    @posts = Post.all.order(created_at: :asc)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    # @user = User.find(current_user.id)
  end

  def create
    Post.create(
      name: post_params[:name],
      content: post_params[:content],
      user_id: current_user.id
    )
    redirect_to posts_path
  end


  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.name = params[:post][:name]
    @post.content = params[:post][:content]
    if @post.save
      redirect_to :posts
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to :posts
  end


private

def post_params
  params.require(:post).permit(:name, :content)
end


end
