class OpportunitiesController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :permit_for_organizations, only: %i[create new edit update destroy]
  before_action :set_opportunity, only: %i[show edit update destroy]
  before_action do
    if current_user && current_user.organization?
      redirect_to org_not_verified_path && return unless current_user.verified?
    end
  end

  def change_in_watchlist
    wishlist_item = current_user.wishlist_items.where(opportunity_id: params[:opportunity_id])
    if wishlist_item.empty?
      wishlist_item = current_user.wishlist_items.new(opportunity_id: params[:opportunity_id])
      if wishlist_item.save
        render json: { success: true }
      else
        render json: { success: false }
      end
    elsif wishlist_item.destroy_all
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  # GET /opportunities
  # GET /opportunities.json
  def index
    @show_variable = false

    @opportunities = if current_user.organization?
                       current_user.opportunities.all
                     else
                       opportunities_matching_user
                     end
  end

  # GET /opportunities/1
  # GET /opportunities/1.json
  def show
    redirect_to root_url && return unless user_signed_in?
    @added_to_watchlist = current_user.wishlist_items.where(opportunity_id: params[:id]).exists?
  end

  # GET /opportunities/new
  def new
    @opportunity = current_user.opportunities.new
  end

  # GET /opportunities/1/edit
  def edit; end

  # GET /opportunities/testopp
  def testopp; end

  # POST /opportunities
  # POST /opportunities.json
  def create
    @opportunity = current_user.opportunities.new(opportunity_params)
    respond_to do |format|
      if @opportunity.save

        MatchMailer.matching_email(@opportunity).deliver

        format.html { redirect_to @opportunity }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunities/1
  # PATCH/PUT /opportunities/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.json
  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunities_url, notice: 'Opportunity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_opportunity
    @opportunity = Opportunity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opportunity_params
    params.require(:opportunity).permit(:name, :featured, :organization, :picture, :opportunity_type_id, :short_description, :country, :city, :deadline, :age_min, :age_max, :residence, :nationality, :education_id, :cost_id, :language, :long_description, :requirements_to_apply, :award, :limitations, :preferences, :website, :link_to_apply)
  end
end
