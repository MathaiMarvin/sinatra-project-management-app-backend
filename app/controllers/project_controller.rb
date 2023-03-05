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
            [201, user.to_json]

        rescue => e
           [422, {
                error: e.message
        }.to_json]
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
            [201, project.to_json]

        rescue => e
            [422, {
                error: e.message
        }.to_json]
        end
        
    end

    get '/projects' do
        # get all projects
        # returns a list of projects
        projects=Project.all

        [200, projects.to_json]

    end

    put '/projects/update/:id' do
        # update a project
        begin
            data = JSON.parse(request.body.read)
            project_id = params['id'].to_i
            project = Project.find(project_id)
            project.update(data)
            {message: "Project added successfully"}.to_json
        rescue =>e
            [422, {
                error: e.message.to_json
            }]
        end
    end

    delete '/projects/destroy/:id' do

        begin

            project_id = params['id'].to_i
            project = Project.find(project_id)
            project.destroy
            {message: "Project deleted successfully"}.to_json

        rescue => e

        [422, {
            error: e.message.to_json
        }]

        end

    end

    
end