class SearchbydescriptionsController < ApplicationController
  before_action :set_searchbydescription, only: [:show, :edit, :update, :destroy]

  require 'OrthologsTree'

 # layout 'application'

  # GET /searchbydescriptions
  # GET /searchbydescriptions.json
  def index
      @groups = Orthologs.all.size
  end

   def go
      desc = params['protein_descriptions']
      @ids = Orthologs.where("protein_description like '%#{desc}%'").order(:source_db, :group_id, :protein_description)

      @root = OrthologsTree.new(nil, 'orthologs')
      #@root << 'kegg'
      #@root << 'eggnog'
      #@root << 'protozoa'

      @ids.each do |reg|
        if reg['source_db'] == 'KEGG'
          @root <<  reg['group_id'] << 'kegg'  << reg['organism_name']
        elsif reg['source_db'] == 'EGGNOG'
          @root << reg['group_id'] << 'eggnog' << reg['organism_name']
        elsif reg['source_db'] == 'PROTOZOADB'  
          @root << reg['group_id'] << 'protozoa' << reg['organism_name']
        end
      end
      
    end
end
