class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy, :admin_actions, :admin_delete]
  before_action :authenticate_user!, only: [:admin_delete, :admin_actions]
  # GET /images
  def index
    @images = Image.where(is_public: true).where(deleted: false).all.decorate
  end

  # GET /images/1
  def show
    if (@image.deleted) && (current_user.nil? || !current_user.is_moderator)
      raise ActiveRecord::RecordNotFound
    end
    
    if @image.deleted 
      flash[:warning] = "This post has been deleted. Be careful!"
    end
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
      @image.user_id = User.where(username: 'guest').limit(1).pluck(:id)[0]
    end

    if @image.save
      redirect_to @image, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /images/1
  def update
    # if @image.update(image_params)
    #   redirect_to @image, notice: 'Image was successfully updated.'
    # else
    #   render :edit
    # end
  end

  # DELETE /images/1
  def destroy
    # @image.destroy
    redirect_to images_url, notice: 'Image was successfully destroyed.'
  end

  def admin_actions
  end

  # POST /images/1/admin_delete
  def admin_delete
    deletion_reasons = {
      0 => 'Other',
      1 => 'Spam',
      2 => 'Illegal content',
      3 => 'Abusive content'
    }
    if current_user.is_admin
      @image.deleted = true
      @image.deleted_by = current_user.id
      @image.deletion_date = Time.now
      if params[:deletion_reason] && deletion_reasons.keys.include?(params[:deletion_reason].to_i)
        @image.deletion_reason = params[:deletion_reason].to_i
      else
        @image.deletion_reason = 0
      end

      if params[:image][:deletion_comment]
        @image.deletion_comment = params[:image][:deletion_comment]
      else
        @image.deletion_comment = nil
      end
      if @image.save
        redirect_to @image, notice: 'Image successfully deleted'
      else
        redirect_to @image, notice: 'There was an error'
      end
    else
      redirect_to @image, notice: 'Only admins can delete images'
    end
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
