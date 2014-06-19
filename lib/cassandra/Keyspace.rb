require 'cql'
require 'logger'

class Keyspace
	attr_accessor :host, :port, :connection
	attr_writer :logger

	def initialize(log)
		@host = '157.86.114.145'
		@port = '9160'
		@logger = log
		@logger.info("Keyspace::initialize")
	end

	def getConnection(keyspaceName)
		@logger.info('Keyspace::getConnection')
		begin
			@connection = Cql::Client.connect(hosts: [@host])
			@connection.use(keyspaceName)
			@logger.debug("Connected: #{keyspaceName}")
		rescue
			@connection = nil
			@logger.debug('Not connected!')
		end
		return @connection
	end
end
