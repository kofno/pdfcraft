Dummy::Application.routes.draw do
  get "/home", to: "home#index", as: :home
  get "/another", to: "home#another", as: :another
  get "/partials", to: "home#partials", as: :partials
  get "/helpers", to: "home#helpers", as: :helpers
end
