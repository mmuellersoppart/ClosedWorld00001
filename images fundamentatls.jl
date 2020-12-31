### A Pluto.jl notebook ###
# v0.12.14

using Markdown
using InteractiveUtils

# ╔═╡ d06d6a48-31a5-11eb-38d3-2f1961f5a39d
using Images, FileIO

# ╔═╡ d31e7808-31a6-11eb-36dc-bb3b57532b63
begin
	img_path = "/Users/marlonmuellersoppart/Documents/Julia/Ecosystem1/images/4color_map.png"
	img = load(img_path)
end

# ╔═╡ 046f78a6-31ae-11eb-026f-d3230a872fed
typeof(img)

# ╔═╡ 6a571976-31ae-11eb-0abd-d3e219c3a26a
RGBX(.4, .6, .1)

# ╔═╡ 8643855a-31ae-11eb-39aa-375a26b41683
size(img)

# ╔═╡ 98bc8738-31ae-11eb-12f6-df2e2c15b35d
img[200, 400]

# ╔═╡ b4572c46-31ae-11eb-3c27-e16d90f4165b
img[1:100, 1:300]

# ╔═╡ d5d69b36-31ae-11eb-2587-275954bf76ed
begin
	(h, w) = size(img)
	quarter = img[(h ÷ 2):h, (w ÷ 2): w]
end

# ╔═╡ 5e92361a-31af-11eb-2a5c-0baca0ab95ee
[
	quarter reverse(quarter, dims=2) quarter reverse(quarter, dims=2)
	reverse(quarter, dims=1) reverse(reverse(quarter, dims=2), dims=1) reverse(quarter, dims=1) reverse(reverse(quarter, dims=2), dims=1)
]


# ╔═╡ 157b5424-31b0-11eb-2e3b-e100f470ad89
newImg = copy(img)

# ╔═╡ 4de7e84a-31b0-11eb-12bd-f73781e4a64d
red = RGB(1, 0, 0)

# ╔═╡ 08c240b6-31b1-11eb-1b2f-73fed70a83e6
newImg[20, 20] = RGB(1, 0, 0)

# ╔═╡ cb563038-31b1-11eb-3f5f-21f223bab5ac
typeof(newImg[1, 1])

# ╔═╡ Cell order:
# ╠═d06d6a48-31a5-11eb-38d3-2f1961f5a39d
# ╠═d31e7808-31a6-11eb-36dc-bb3b57532b63
# ╠═046f78a6-31ae-11eb-026f-d3230a872fed
# ╠═6a571976-31ae-11eb-0abd-d3e219c3a26a
# ╠═8643855a-31ae-11eb-39aa-375a26b41683
# ╠═98bc8738-31ae-11eb-12f6-df2e2c15b35d
# ╠═b4572c46-31ae-11eb-3c27-e16d90f4165b
# ╠═d5d69b36-31ae-11eb-2587-275954bf76ed
# ╠═5e92361a-31af-11eb-2a5c-0baca0ab95ee
# ╠═157b5424-31b0-11eb-2e3b-e100f470ad89
# ╠═4de7e84a-31b0-11eb-12bd-f73781e4a64d
# ╠═08c240b6-31b1-11eb-1b2f-73fed70a83e6
# ╠═cb563038-31b1-11eb-3f5f-21f223bab5ac
