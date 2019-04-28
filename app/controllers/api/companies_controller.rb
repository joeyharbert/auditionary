class Api::CompaniesController < ApplicationController
  def index
    @companies = Company.all

    render 'index.json.jbuilder'
  end
end
