class UserRoleRelationshipsController < ApplicationController
  before_action :set_user_role_relationship, only: [:show, :edit, :update, :destroy]

  # GET /user_role_relationships
  # GET /user_role_relationships.json
  def index
    @user_role_relationships = UserRoleRelationship.all
  end

  # GET /user_role_relationships/1
  # GET /user_role_relationships/1.json
  def show
  end

  # GET /user_role_relationships/new
  def new
    @user_role_relationship = UserRoleRelationship.new
  end

  # GET /user_role_relationships/1/edit
  def edit
  end

  # POST /user_role_relationships
  # POST /user_role_relationships.json
  def create
    @user_role_relationship = UserRoleRelationship.new(user_role_relationship_params)

    respond_to do |format|
      if @user_role_relationship.save
        format.html { redirect_to @user_role_relationship, notice: 'User role relationship was successfully created.' }
        format.json { render :show, status: :created, location: @user_role_relationship }
      else
        format.html { render :new }
        format.json { render json: @user_role_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_role_relationships/1
  # PATCH/PUT /user_role_relationships/1.json
  def update
    respond_to do |format|
      if @user_role_relationship.update(user_role_relationship_params)
        format.html { redirect_to @user_role_relationship, notice: 'User role relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_role_relationship }
      else
        format.html { render :edit }
        format.json { render json: @user_role_relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_role_relationships/1
  # DELETE /user_role_relationships/1.json
  def destroy
    @user_role_relationship.destroy
    respond_to do |format|
      format.html { redirect_to user_role_relationships_url, notice: 'User role relationship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_role_relationship
      @user_role_relationship = UserRoleRelationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_role_relationship_params
      params.require(:user_role_relationship).permit(:user_id, :role_id)
    end
end
