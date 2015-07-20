class Admin::TagsController < Admin::ApplicationController
  def index
    @tags = Tag.where(nil)
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new

    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render 'edit'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to admin_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
