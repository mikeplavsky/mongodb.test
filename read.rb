require "mongo"

db = Mongo::Connection.new.db "sa4sp"
coll = db[ "permissions" ]

coll.find().each do |d|
   puts d 
end

puts coll.find_one( "site" => "http://test1" )

