require_relative "./config/environment"
require 'rack/cors'

use Rack::Cors do
  allow do
    origins 'https://project-management-app-8lo7.onrender.com/'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end
  
run ProjectController 