require 'cql'

client = Cql::Client.connect(hosts: ['157.86.114.140'])
client.use('orthosearchdb')
rows = client.execute('SELECT * FROM orthologs')
rows.each do |row|
  puts row
end
