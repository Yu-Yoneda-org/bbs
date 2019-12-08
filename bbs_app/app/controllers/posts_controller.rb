class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.name == ""
      @post.name = "名無しさん"
    end
    respond_to do |format|
      if @post.save
        format.html {redirect_to topics_show_path(@post.topic_id), notice: '投稿できたよ。' }
      else
        format.html {redirect_to topics_show_path(@post.topic_id), notice: '内容を書いてね。' }
      end
    end
  end

  # PATCH/PUT /posts/1
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to topics_show_path(@post.topic_id), notice: 'コメントを編集しました。'  }
      else
        format.html {redirect_to topics_show_path(@post.topic_id), notice: 'コメントを編集できませんでした。' }
      end
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to topics_show_path(@post.topic_id), notice: 'コメントを削除しました。' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :content, :image, :topic_id)
    end
end
