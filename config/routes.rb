Rails.application.routes.draw do
  resources :lab_reports
  root to: "lab_reports#index"
  get '/lab_reports/:id/add_grade', to: 'lab_reports#add_grade', as: 'add_grade_lab_report'
  patch '/lab_reports/:id/update_grade', to: 'lab_reports#update_grade', as: 'update_grade_lab_report'
  resources :users
end
