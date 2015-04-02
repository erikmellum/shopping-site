class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  # GET /relationships
  # GET /relationships.json
  def index
    @member = Member.find(params[:member_id])
    @relationships = @member.relationships
  end

  # GET /relationships/1
  # GET /relationships/1.json
  def show
  end

  # GET /relationships/new
  def new
    @member = Member.find(params[:member_id])
    @relationship = Relationships.new
    @eligible_members = []
    Member.all.each do |m|
      relationship_flag = false  
      m.relationships.each do |r|
        if r.member_two == @member
          relationship_flag = true;
        end
      end  
      @eligible_members << m if relationship_flag == false  
    end
    @eligible_members - [@member]
  end

  # GET /relationships/1/edit
  def edit
  end

  # POST /relationships
  # POST /relationships.json
  def create
    @member = Member.find(params[:member_id])
    @relationship = Relationship.new(relationship_params)
    @relationship.member_one = @member
    @relationship.member_two = params[:relationship_member_id]
    #Member 2 is the member that is also part of this relationship
#    @member2 = Member.find(params[:member])
    respond_to do |format|
      if @relationship.save
        format.html { redirect_to @member, notice: 'Relationship was successfully created.' }
        format.json { render :show, status: :created, location: @relationship }
      else
        format.html { render :new }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  def update
    respond_to do |format|
      if @relationship.update(relationship_params)
        format.html { redirect_to @member, notice: 'Relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @relationship }
      else
        format.html { render :edit }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship.destroy
    respond_to do |format|
      format.html { redirect_to relationships_url, notice: 'Relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:name)
    end
end
