class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    if(params[:family_id] != nil)
    @family = Family.find(params[:family_id])
    @images = Image.all.map{|image| image if(image.family == @family)}.compact
    elsif(params[:member_id] != nil)
      puts('*'*50)
      puts('*'*50)
      puts(params)
      puts('*'*50)
      puts('*'*50)
      @member = Member.find(params[:member_id])
      @images = Image.all.map{|image| image if(image.member == @member)}.compact
    end
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @image = Image.find params[:id]
    @tag = @image.tags.new
    @like = @image.likes.new
  end

  # GET /images/new
  def new
    if params[:member_id] != nil
    @member = Member.find(params[:member_id])
    @image = @member.images.new
    elsif params[:family_id] != nil
    @family = Family.find(params[:family_id])
    @image = @family.images.new
    end
  end

  # GET /images/1/edit
  def edit
  end

  def like
    if(current_user.likes.map{|like| like if(like.user == current_user)}.compact.length == 0) 
    @image = Image.find(params[:id])
    @like = @image.likes.new(like_params)
    @like.user = current_user
    @image.save
    end
  end

  def unlike
    current_user.likes.each{|like| Like.delete(like) if(like.user == current_user)}
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    if params[:family_id] 
      @image.family = Family.find(params[:family_id]) 
    elsif params[:member_id]
      @image.member = Member.find(params[:member_id])
      puts('*'*50)
      puts('*'*50)
      puts(params)
      puts('*'*50)
      puts('*'*50)
    elsif params[:event_id]
      @image.event = Event.find(params[:event_id])
    end
    @image.generate_filename
    @uploaded_io = params[:image][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @image.filename), 'wb') do |file|
      file.write(@uploaded_io.read)
    end
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to member_url(@image.member), notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:description, :user_id)
    end
end
