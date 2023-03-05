class ProjectController < Sinatra::Base

    # get '/hey' do
    #     "Hey there!"
    # end

    # Creating users
    post '/users/create' do
        # Create a new user
        # Data is formatted as json
        data = JSON.parse(request.body.read)

        #Creating a user record in the table
        begin
            user = User.create(data)
            user.to_json

        rescue => e
            {
                error: e.message
        }.to_json
        end
    end

    post '/projects/create' do
        # create a new project
        # Data has been formatted as json
        data = JSON.parse(request.body.read)

        # Set the user_id of the project to the ID of the current user
        user_id = data['user_id']

        # create a record in the table
        begin
            today = Time.now
            data["createdAt"] = today
            project = Project.create(data)
            project.user_id = user_id
            project.to_json

        rescue => e
            {
                error: e.message
        }.to_json
        end
        
    end

    
end