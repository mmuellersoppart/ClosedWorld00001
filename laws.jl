
include("./species.jl")

module laws


  foodchain = Dict{String, String}(
    REAVINS => GINIPS,
    GINIPS => BLOUEN,
    BLOUEN => OUGE,
    OUGE => REAVINS,
  )

end
