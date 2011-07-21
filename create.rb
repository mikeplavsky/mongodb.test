require "mongo"

db = Mongo::Connection.new.db "sa4sp"

coll = db["permissions"]

100.times do |i|
  coll.insert "site" => "http://test#{i}", "account" => "product\Lamer" , "rights" => "read;write"
end
