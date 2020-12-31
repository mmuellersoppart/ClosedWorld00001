
module Species
export REAVINS, GINIPS, BLOUEN, OUGE

const REAVINS = "REAVINS"
const GINIPS = "GINIPS"
const BLOUEN = "BLOUEN"
const OUGE = "OUGE"

end

module laws

  using Species

  foodchain = Dict{String, String}(
    REAVINS => GINIPS,
    GINIPS => BLOUEN,
    BLOUEN => OUGE,
    OUGE => REAVINS,
  )

end

print(laws.foodchain.keys)
