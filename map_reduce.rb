require "mongo"

db = Mongo::Connection.new.db "sa4sp"
coll = db[ "permissions" ]

map = <<EOF 

  function () {
    emit(this.site, {});      
  }
 
EOF

reduce = <<EOF

  function (key, values) {

    var res = {count:0, calls: 10};
    values.forEach( function (v) {
      res.count += 1;
    } 
    );
    return res;
  }

EOF

res = coll.map_reduce( map, reduce, { :out => {:inline => true}, :raw => true } )

res.each do |x|
  puts x
end


