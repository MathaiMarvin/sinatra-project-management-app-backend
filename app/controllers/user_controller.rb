class UserController < Sinatra::Base

    post '/users/create' do
        # create a new project
        data = request.body.read
        data.to_s
    end
end