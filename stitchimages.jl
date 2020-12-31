### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ e416bc06-49f7-11eb-24c4-33127470e039
using Images

# ╔═╡ 6b2e7324-49f7-11eb-36d9-4d57fdb3239c
md"# Craft images using blocks of colors"

# ╔═╡ 82622962-49f9-11eb-3fab-1d46033002ea
md"### horizontal stitch"

# ╔═╡ a1d5c63e-49f7-11eb-36b1-83dd3e76225a
begin
	leftimg = [RGB(.2, .85, .2) for x in 1:60, x in 1:20]
	rightimg = [RGB(.887, .35, .1) for x in 1:60, x in 1:20]
end;

# ╔═╡ 66947a10-49f8-11eb-3605-4da9e979ee09
stitchhorizontal = [leftimg rightimg]

# ╔═╡ 8138e13e-4a03-11eb-276b-3760f068b8bb
md"can we use the stitched image?"

# ╔═╡ 8f60d380-49f8-11eb-369c-9ff8f6c399d3
#get section
begin
	squarelength = 10
(h, w) = size(stitchhorizontal)
stitchhorizontal[h÷2 - squarelength: h÷2 + squarelength, w÷2 - squarelength:w÷2 + squarelength]
end

# ╔═╡ 80036af0-49f9-11eb-35ba-1f1b3fe8ace4
md"### vertical stitch"

# ╔═╡ 8fb58eb6-4a02-11eb-1ee1-ddee60ca2910
begin
topimg = [RGB(1.0, .84, .005) for y in 1:20, x in 1:60]
bottomimg = [RGB(.005, .84, 1.0) for y in 1:20, x in 1:60]
end;

# ╔═╡ 2adcbda6-4a03-11eb-3c23-a757103a4fd4
stitchvertical = [
	topimg
	bottomimg
	]

# ╔═╡ Cell order:
# ╟─6b2e7324-49f7-11eb-36d9-4d57fdb3239c
# ╠═e416bc06-49f7-11eb-24c4-33127470e039
# ╟─82622962-49f9-11eb-3fab-1d46033002ea
# ╠═a1d5c63e-49f7-11eb-36b1-83dd3e76225a
# ╠═66947a10-49f8-11eb-3605-4da9e979ee09
# ╟─8138e13e-4a03-11eb-276b-3760f068b8bb
# ╟─8f60d380-49f8-11eb-369c-9ff8f6c399d3
# ╟─80036af0-49f9-11eb-35ba-1f1b3fe8ace4
# ╠═8fb58eb6-4a02-11eb-1ee1-ddee60ca2910
# ╠═2adcbda6-4a03-11eb-3c23-a757103a4fd4
