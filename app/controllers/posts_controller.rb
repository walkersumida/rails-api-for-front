class PostsController < AuthenticatedController
  before_action :set_post, only: %i(show update destroy)

  def index
    @posts = current_user.posts
  end

  def show
    # noop
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render :show
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :status)
  end
end
