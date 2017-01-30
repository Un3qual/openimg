class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  def index
    @images = Image.all.decorate
  end

  # GET /images/1
  def show
    
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.new(image_params)

    if user_signed_in?
      @image.user_id = current_user.id
    else
      @image.user_id = User.where(username: 'Guest').limit(1).pluck(:id)[0]
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to @image, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /images/1
  def destroy
    @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id]).decorate
    end

    # Only allow a trusted parameter "white list" through.
    def image_params
      params.require(:image).permit(:caption, :file, :is_public, :user_id)
    end
end
