### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 9411e94a-492c-11eb-1092-998b73a0b097
using Images, FileIO

# ╔═╡ 336ff04e-4929-11eb-3440-cdbb16b7f291
md"# Creating images from scratch"

# ╔═╡ 9bd61b80-4934-11eb-3d59-f50c0643fc79
md"#### imports"

# ╔═╡ 93522124-493a-11eb-173a-f1c0f39617bc
md"## Grayscale"

# ╔═╡ 82965d04-4934-11eb-16b1-a9f157feea36
md"### Make image from binary array (bitmap)"

# ╔═╡ b9c0aae8-4934-11eb-2b46-93e187c25740
binaryarray = rand(Bool, 5, 5)

# ╔═╡ 35ea943a-4935-11eb-101e-abe850d906bc
colorview(Gray, binaryarray)

# ╔═╡ 3773a21a-4935-11eb-3d7e-0bfd5cd9222b
md"### Make and image using Gray"

# ╔═╡ e18edafa-492b-11eb-0e59-4f200d1490ac
# grayscale image 
img_gray = rand(Gray, 5, 5)
# Because Gray is used pluto.jl knows to show it as a color view"

# ╔═╡ bac4fc40-493a-11eb-3f2f-2d0c64202937
md"# Color"

# ╔═╡ 71d0373e-493a-11eb-3dc7-9fe38fde1044
md"### handcraft a 9x9 rgba image"

# ╔═╡ d06963d4-4948-11eb-276a-3b8e741fedf6
import Pkg; Pkg.add("FixedPointNumbers")

# ╔═╡ d28638ac-49f4-11eb-0e45-8d696766fedf
# custom util function

function to_RGB(values)
	
	if length(values) == 3
		r, g, b = values
		RGB(r, g, b)
	elseif length(values) == 4
		r, g, b, a, = values
		RGBA(r, g, b, a)
	else
			throw(ErrorException("Invalid color input"))
			
	end
end


# ╔═╡ 7e2438a8-49f5-11eb-359b-c7f121918858
#test
to_RGB((.5, .5, .5, .6))

# ╔═╡ ea6e688e-494c-11eb-3ee2-c71f68d0668f
value_grid = [(x, x, y, 1 - y - x) for x in 0.0:(1.0/3.0):1.0, y in 0.0:(1.0/3.0):1.0]

# ╔═╡ e754a45e-4953-11eb-3551-6b1b576da310
to_RGB.(value_grid)

# ╔═╡ 0c50a5da-49f6-11eb-3211-db0927c2af6d
md"#### random colorful image"

# ╔═╡ 31d642ee-49f6-11eb-2ad4-a9acf55fe841
img_rand_color = rand(RGB, 25, 25)

# ╔═╡ Cell order:
# ╟─336ff04e-4929-11eb-3440-cdbb16b7f291
# ╟─9bd61b80-4934-11eb-3d59-f50c0643fc79
# ╠═9411e94a-492c-11eb-1092-998b73a0b097
# ╟─93522124-493a-11eb-173a-f1c0f39617bc
# ╟─82965d04-4934-11eb-16b1-a9f157feea36
# ╠═b9c0aae8-4934-11eb-2b46-93e187c25740
# ╠═35ea943a-4935-11eb-101e-abe850d906bc
# ╟─3773a21a-4935-11eb-3d7e-0bfd5cd9222b
# ╠═e18edafa-492b-11eb-0e59-4f200d1490ac
# ╟─bac4fc40-493a-11eb-3f2f-2d0c64202937
# ╟─71d0373e-493a-11eb-3dc7-9fe38fde1044
# ╠═d06963d4-4948-11eb-276a-3b8e741fedf6
# ╠═d28638ac-49f4-11eb-0e45-8d696766fedf
# ╠═7e2438a8-49f5-11eb-359b-c7f121918858
# ╠═ea6e688e-494c-11eb-3ee2-c71f68d0668f
# ╠═e754a45e-4953-11eb-3551-6b1b576da310
# ╠═0c50a5da-49f6-11eb-3211-db0927c2af6d
# ╠═31d642ee-49f6-11eb-2ad4-a9acf55fe841
