Rails.application.routes.draw do
  resources :sign_petitions
  resources :petitions
  resources :pr_committee_members
  resources :pr_committees
  resources :sectors
  resources :government_bodies
  resources :government_body_types
  resources :regions
  resources :training_funds do
    collection do
      get 'funding_by_area'
    end
  end
  get 'reports/trainings'
  post 'reports/trainings'
  get 'reports/health_workers'
  post 'reports/health_workers'
  get 'reports/trainees'
  post 'reports/trainees'

  resources :trainees do
    collection do
      get 'load_trainees'
      get 'institution_trainees_by_area'
      get 'institution_trainees_by_region'
      get 'institution_trainees_by_year'

      get 'org_unit_trainees_by_area'
      get 'org_unit_trainees_by_year'
      get 'org_unit_trainees_by_category'
    end
  end
  resources :people do
    collection do
      get 'load_people'
      get 'load_professions'
    end
  end
  resources :facilities do
    collection do
      get 'load_facilities'
    end
  end
  resources :facility_types
  resources :trainings do
    collection do
      get 'load_distribution'
    end
    member do
      delete 'cancel'
      get 'undo_cancel'
    end
  end

  resources :training_titles do
    collection do
      get 'training_titles_by_area'
      get 'load_training_titles'
    end
  end

  resources :institutions
  resources :institution_types
  resources :organization_units do
    collection do
      get 'load_tree'
      get 'load_sub_units'
      get 'org_unit_facilities'
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
