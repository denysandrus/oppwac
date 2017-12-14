require 'test_helper'

class OpportunitiesControllerTest < ActionController::TestCase
  setup do
    @opportunity = opportunities(:one)
  end

  test 'should get index' do
    get :invite
    assert_response :success
    assert_not_nil assigns(:opportunities)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create opportunity' do
    assert_difference('Opportunity.count') do
      post :create, opportunity: { age_max: @opportunity.age_max, age_min: @opportunity.age_min, award: @opportunity.award, city: @opportunity.city, cost: @opportunity.cost, country: @opportunity.country, deadline: @opportunity.deadline, education: @opportunity.education, language: @opportunity.language, limitations: @opportunity.limitations, link_to_apply: @opportunity.link_to_apply, long_description: @opportunity.long_description, name: @opportunity.name, nationality: @opportunity.nationality, opportunity_type: @opportunity.opportunity_type, organization: @opportunity.organization, preferences: @opportunity.preferences, requirements_to_apply: @opportunity.requirements_to_apply, residency: @opportunity.residency, short_description: @opportunity.short_description, website: @opportunity.website }
    end

    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test 'should show opportunity' do
    get :show, id: @opportunity
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @opportunity
    assert_response :success
  end

  test 'should update opportunity' do
    patch :update, id: @opportunity, opportunity: { age_max: @opportunity.age_max, age_min: @opportunity.age_min, award: @opportunity.award, city: @opportunity.city, cost: @opportunity.cost, country: @opportunity.country, deadline: @opportunity.deadline, education: @opportunity.education, language: @opportunity.language, limitations: @opportunity.limitations, link_to_apply: @opportunity.link_to_apply, long_description: @opportunity.long_description, name: @opportunity.name, nationality: @opportunity.nationality, opportunity_type: @opportunity.opportunity_type, organization: @opportunity.organization, preferences: @opportunity.preferences, requirements_to_apply: @opportunity.requirements_to_apply, residency: @opportunity.residency, short_description: @opportunity.short_description, website: @opportunity.website }
    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test 'should destroy opportunity' do
    assert_difference('Opportunity.count', -1) do
      delete :destroy, id: @opportunity
    end

    assert_redirected_to opportunities_path
  end
end
