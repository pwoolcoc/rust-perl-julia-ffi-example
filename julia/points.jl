function make_point(a::Int, b::Int)
  ccall( (:make_point, "target/libpoints"), Ptr{Void}, (Int64, Int64), a, b)
end

function get_distance(a::Ptr{Void}, b::Ptr{Void})
  ccall( (:get_distance, "target/libpoints"), Float64, (Ptr{Void}, Ptr{Void}), a, b)
end


t = make_point(2, 2)
u = make_point(4, 4)

v = get_distance(t, u)
println(v)
