class Admin::OdersController < ApplicationController
  before_action :authenticate_admin!
end
