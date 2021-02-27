module Admin

class PostsController < ApplicationController
  before_action :target_post, except: %i[index new create]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = t('global.save_success', subject: Post.model_name.human)
      redirect_to admin_posts_path
    else
      flash[:failure] = t('global.save_failure', subject: Post.model_name.human)
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:success] = t('global.save_success', subject: Post.model_name.human)
      redirect_to admin_posts_path
    else
      flash[:failure] = t('global.save_failure', subject: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:admin_post).permit(:title, :subject, :note, :status, :image, :post_type)
  end

  def target_post
    @post = Post.find_by(id: params[:id])
  end
end

end
