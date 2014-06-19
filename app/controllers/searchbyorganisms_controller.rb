class SearchbyorganismsController < ApplicationController
  require 'OrthologsTree'

 def index
      @groups = Orthologs.all.size
  end

   def go
      org = params['organism']
      @ids = Orthologs.find_by_sql("select * from orthologs where group_id in (select group_id from orthologs where organism_name like '%#{org}%')")

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
