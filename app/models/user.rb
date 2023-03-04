require 'bcrypt'
class User < ActiveRecord::Base
    has_many :projects
    has_secure_password :password

end