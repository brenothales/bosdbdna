require './Keyspace.rb'
require './Queries.rb'
require 'logger'

log = Logger.new(STDOUT)

key = Keyspace.new(log)
con = key.getConnection('orthosearchdb')
qry = Queries.new(log, con)

rows = qry.getAll()
rows.each do |row|
  puts row
end

rows = qry.getBySourceDB('KEGG')
rows.each do |row|
  puts row
end