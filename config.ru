require_relative "./config/environment"
require 'rack/cors'

use Rack::Cors do
  allow do
    origins 'https://project-management-app-six-mocha.vercel.app/'
    resource '*', headers: :any, methods: [:get, :post, :put, :delete, :options]
  end
end
  
run ProjectController 