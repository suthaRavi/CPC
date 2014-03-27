class ProfilesController < ApplicationController
  before_action :load_user,:set_profile, only: [:show, :edit, :update, :destroy]
  
  layout 'registrations' 
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    
    #@profile = Profile.new
    current_user.profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @u.interests=(params{interest})
    respond_to do |format|
      if @profile.save
        
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = current_user.profile
      #@profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
     params.require(:profile).permit(:firstName, :lastName, :aptNo, :street, :city, :province, :country, 
      :postalcode, :phoneNumber, :cellphone, :gender, :birthday,:ethncity, :maritalStatus, :carrier, 
      :interest_ids =>[], :send_email_ids => [], :favorite_store_ids => [
        
      ])
    end
    def load_user
      @user = current_user
    end
end