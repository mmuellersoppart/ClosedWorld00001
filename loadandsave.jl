### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 0c66a322-4a04-11eb-2bed-353346ec4663
using Images, FileIO, TestImages

# ╔═╡ e1d3e8c4-4a03-11eb-253d-915732b7a19d
md"# load and save image"

# ╔═╡ 0271dd1e-4a04-11eb-0b8b-2d544b8c003c
md"#### and then load saved image"

# ╔═╡ 2ca09bb0-4abc-11eb-1125-0142935b92ba
md"## Using TestImages"

# ╔═╡ dd634b74-4a07-11eb-0c61-6da8b96c10d2
md"### get sample image"

# ╔═╡ 14cc47ba-4a04-11eb-2377-3dc28a07edbe
testimg1 = testimage("fabio_color_256")

# ╔═╡ 59d6fa70-4a0a-11eb-0d32-27f773c67b06
typeof(testimg1)

# ╔═╡ 2dd6f300-4a08-11eb-3e12-79a1ea7ec59f
md"### save fabio"

# ╔═╡ 38bc31fe-4a08-11eb-0df6-75bb474bc3af
# the extension of the image name is important
save("./output/fabio.png", testimg1)

# ╔═╡ 3c3496a0-4abc-11eb-2657-b73c6507e0b6
md"## Using custom images"

# ╔═╡ e561db0a-4ab9-11eb-1ae6-3d15147c3158
md"### get my own image"

# ╔═╡ f76441b2-4ab9-11eb-17bc-b724c6f30918
myimg = load("./images/t1.jpg")

# ╔═╡ 1e5c4e0a-4abc-11eb-1e59-0910c9e99520
md"### adjust and save"

# ╔═╡ 53256696-4abc-11eb-2fa4-03a39904c662
begin
	myimg[1:100, 1:100] .= RGB(1.0, 0.0, 0.0) 
	myimg
end

# ╔═╡ 1a1af3e0-4aba-11eb-0acd-8f31afe2a73c
save("./output/t1_adjusted.jpg", myimg)

# ╔═╡ ef815c7a-4abc-11eb-2e41-03311a0997a7
md"## clear directory"

# ╔═╡ fb892372-4abc-11eb-0ab0-4b4e50d69b9e
outputpath = mkpath("./output/")

# ╔═╡ 40779c7a-4abd-11eb-1482-ffb396c3ff2e
rm(outputpath, recursive=true, force=true)

# ╔═╡ Cell order:
# ╟─e1d3e8c4-4a03-11eb-253d-915732b7a19d
# ╟─0271dd1e-4a04-11eb-0b8b-2d544b8c003c
# ╠═0c66a322-4a04-11eb-2bed-353346ec4663
# ╟─2ca09bb0-4abc-11eb-1125-0142935b92ba
# ╟─dd634b74-4a07-11eb-0c61-6da8b96c10d2
# ╠═14cc47ba-4a04-11eb-2377-3dc28a07edbe
# ╠═59d6fa70-4a0a-11eb-0d32-27f773c67b06
# ╟─2dd6f300-4a08-11eb-3e12-79a1ea7ec59f
# ╠═38bc31fe-4a08-11eb-0df6-75bb474bc3af
# ╟─3c3496a0-4abc-11eb-2657-b73c6507e0b6
# ╟─e561db0a-4ab9-11eb-1ae6-3d15147c3158
# ╠═f76441b2-4ab9-11eb-17bc-b724c6f30918
# ╟─1e5c4e0a-4abc-11eb-1e59-0910c9e99520
# ╠═53256696-4abc-11eb-2fa4-03a39904c662
# ╠═1a1af3e0-4aba-11eb-0acd-8f31afe2a73c
# ╟─ef815c7a-4abc-11eb-2e41-03311a0997a7
# ╠═fb892372-4abc-11eb-0ab0-4b4e50d69b9e
# ╠═40779c7a-4abd-11eb-1482-ffb396c3ff2e
