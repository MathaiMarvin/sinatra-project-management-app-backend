class ProjectController < Sinatra::Base

    # get '/hey' do
    #     "Hey there!"
    # end

    post '/projects/create' do
        # create a new project
        data = request.body.read
        data.to_s
    end

    
end