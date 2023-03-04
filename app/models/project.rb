class Project < ActiveRecord::Base
    belongs_to :users
    enum :status, [:CREATED, :ONGOING, :COMPLETED, :CANCELLED]

end