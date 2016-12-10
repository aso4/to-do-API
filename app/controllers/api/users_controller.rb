class Api::UsersController < ApplicationController

  before_action :authenticated?

  def index
    #code here
    #Write index to return a UserSerializer-generated JSON representation of all users.
    #The final line of the index method will look like:

    render json: users, each_serializer: UserSerializer
  end
end
