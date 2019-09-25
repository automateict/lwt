Rails.application.routes.draw do
  resources :comments
  resources :complaint_reports
  resources :people
  resources :petition_reports
  resources :petition_review_members
  resources :signatures
  resources :pr_committees
  resources :petitions do
    member do
      get 'sign'
      patch 'add_comment'
    end
    collection do
      get 'petitions_by_status'
      get 'petitions_by_org_unit_by_status'
      get 'petitions_by_sector_by_status'
      get 'load_petitions'
    end
  end
  resources :departments
  resources :cr_committee_members
  resources :cr_committees
  resources :complaints do
    collection do
      get 'complaints_by_status'
      get 'complaints_by_org_unit_by_status'
      get 'load_complaints'
    end
  end
  resources :pr_committee_members
  resources :sectors

  resources :people do
    collection do
      get 'load_people'
      get 'load_professions'
    end
  end

  resources :organization_units do
    collection do
      get 'load_tree'
      get 'load_sub_units'
      get 'org_unit_facilities'
      get 'load_petition_tree'
      get 'load_petition_sub_units'
    end
  end
  resources :organization_types
  resources :roles
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  scope "/admin" do
    resources :users do
      collection do
        get 'load_users'
        get 'institution_users'
        get 'new_institution_user'
        get 'edit_institution_user'
      end
    end
  end
  get 'home/index'
  root to: "home#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
