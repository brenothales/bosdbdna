require 'cql'
require 'logger'

class Queries
	attr_accessor :connection, :rows

	def initialize(log, connection)
		@connection = connection
		@logger = log
		@logger.info('Queries::initialize')
	end

	def getAll()
		@logger.info('Queries::getAll')
		begin
			@rows = @connection.execute('SELECT * FROM orthologs')
		rescue Exception => e 
			@logger.fatal(e.message)
		end
	end

	def getBySourceDB(sourceDB)
		@rows = @connection.execute("SELECT * FROM orthologs WHERE source_db = '#{sourceDB}'")
		#@rows = @connection.execute(sourceDB)
	end
end