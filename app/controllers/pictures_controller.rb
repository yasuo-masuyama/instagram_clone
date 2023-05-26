class PicturesController < ApplicationController
  before_action :set_picture, only: %i[ show edit update destroy ]
  skip_before_action :login_required

  def index
    @pictures = Picture.all
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture = current_user.pictures.build(picture_params)

    if @picture.save
      ContactMailer.contact_mail(@picture).deliver
      redirect_to pictures_path
    else
      render :new
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def edit
    if @picture.user == current_user
      render :edit
    else
      flash[:notice] = "お前に権限はない"
      redirect_to pictures_path
    end
  end

  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "更新しました！"
    else
      render :edit
    end
  end

  def destroy
    if @picture.user == current_user
      @picture.destroy
      redirect_to pictures_path, notice: "消しました！"
    else
      flash[:notice] = "お前に権限はない"
      redirect_to pictures_path
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
end
