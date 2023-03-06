class ProjectController < Sinatra::Base


    before do
      headers 'Access-Control-Allow-Origin' => '*', 
              'Access-Control-Allow-Methods' => ['OPTIONS', 'GET', 'POST'],
              'Access-Control-Allow-Headers' => 'Content-Type'
    end
    # get '/hey' do
    #     "Hey there!"
    # end

    # Creating users
    post '/users/signup' do
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

    # post '/users/login' do
    #     begin
    #       data = JSON.parse(request.body.read)
    #       username = data['username']
    #       password = data['password']
      
    #       user = User.find { |u| u[:username] == username && u[:password_digest] == password }
      
    #       if user
    #         content_type :json
    #         { id: user[:id], username: user[:username] }.to_json
    #       else
    #         halt 401, 'Unauthorized'
    #       end
    #     rescue JSON::ParserError
    #       halt 400, 'Bad request'
    #     rescue StandardError => e
    #       halt 500, "Internal server error: #{e.message}"
    #     end
    #   end
    post '/users/login' do
        begin
          data = JSON.parse(request.body.read)
          username = data['username']
          password = data['password']



      
          user = User.find { |u| u[:username] == username }
      
          if user && BCrypt::Password.new(user[:password_digest]) == password
            content_type :json
            { id: user[:id], username: user[:username] }.to_json
          else
            halt 401, 'Unauthorized'
          end
        rescue JSON::ParserError
          halt 400, 'Bad request'
        rescue StandardError => e
          halt 500, "Internal server error: #{e.message}"
        end
      end

    post '/projects/create' do
        # create a new project
        # Data has been formatted as json
        data = JSON.parse(request.body.read)



        # create a record in the table
        begin
            today = Time.now
            data["createdAt"] = today
            project = Project.create(data)
            
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
    get '/projects/:id' do
        project = Project.find(params[:id])
      
        if project
          [200, project.to_json]
        else
          [404, { error: "Project not found" }.to_json]
        end
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