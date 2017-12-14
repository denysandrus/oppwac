class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[index verify sign_up partners check_if_email_exist participate_in_beta check_coupon redeem_coupon]
  before_action :check_if_role_exist, only: :invite
  before_action :check_if_verified, except: %i[index verify sign_up partners check_if_email_exist participate_in_beta check_coupon redeem_coupon]

  def index
    if user_signed_in?
      @opps = if current_user.organization?
                current_user.opportunities.all
              else
                opportunities_matching_user
              end
      @opps_in_watchlist = current_user.wishlist_items.map(&:opportunity)
    end
    @featured_opportunity = Opportunity.where(featured: true).where('deadline > ?', DateTime.now).first
  end

  def org_not_verified; end

  def partners; end

  def verify
    id = params[:id]
    org = User.find(id)
    org.verification_status = 'verified'
    org.save
    render json: { success: true }
  end

  def check_if_email_exist
    respond_to do |format|
      format.json { render json: { success: User.exists?(email: params[:email]) } }
    end
  end

  def participate_in_beta
    BetaUser.create(email: params[:email])
    render json: { success: true }
  end

  def sign_up
    @opp_types = OpportunityType.all
  end

  def check_coupon
    if Coupon.exists?(code: params[:coupon])
      code = Coupon.find_by code: params[:coupon]
      if code.status == 'active' && code.usage_limit.positive?
        render json: { success: true }
      else
        render json: { error: true }
      end
    else
      render json: { error: true }
    end
  end

  def redeem_coupon
    code = Coupon.find_by code: params[:coupon].to_s
    code.redeem
  end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to details_path, notice: 'Your details were successfully updated.' }
        format.json { render status: :ok } # TODO: return user object
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :picture, :role_id, :organization_description, :date_of_birth, :nationality, :residence, :current_education_id, :looking_education_id)
  end
end
