class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  private

  def permit_for_organizations
    redirect_to root_path && return if current_user.role.nil? || !current_user.organization?
  end

  def check_if_role_exist
    redirect_to details_path && return if user_signed_in? && current_user.role.nil?
  end

  def check_if_verified
    redirect_to root_path && return unless current_user && current_user.organization?
    render 'home/org_not_verified' unless current_user.verified?
  end

  def opportunities_matching_user
    return false unless user_conditions_met?
    Opportunity.all.select { |opp| user_matches?(opp) }
  end

  def user_matches?(opp)
    opp.nationality.include?(current_user.nationality) &&
      opp.residence.include?(current_user.residence) &&
      opp.age_min <= current_user.age &&
      opp.age_max > current_user.age &&
      opp.education_id <= current_user.current_education_id &&
      opp.education_id >= current_user.looking_education_id
  end

  def user_conditions_met?
    user_signed_in? && current_user.nationality.present? && current_user.age.present? && current_user.current_education_id.present? && current_user.looking_education_id.present?
  end
end
