class DetailsController < ApplicationController

  def show
    group_id = params['id']
    @root = Orthologs.where("group_id = '#{group_id}'").order(:organism_name)

    
  end


end
