class OrthologsController < ApplicationController
	def index
		@version = "1.0"

		@orthologs = Orthologs.all
	end
end
