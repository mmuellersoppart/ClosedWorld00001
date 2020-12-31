### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ cd0711f8-4abe-11eb-2eba-a5ab1ec99282
using Images, FileIO

# ╔═╡ b01f28bc-4abe-11eb-0001-77fa8af80c96
md"# The Colors of an Image"

# ╔═╡ 9f6040ba-4abe-11eb-2890-999a852ae83d
myimg = load("./images/t2.png")

# ╔═╡ aa746916-4b6f-11eb-0587-cdfd14c66b77
#jank resize
# always resizes to 100 pixels
function resizeto100(img)
	(h, w) = size(img)
    hstep = Int(100/h * h)
	wstep = Int(100/w * w)
	
	img_small = copy(img)
	return img_small[1:hstep:h, 1:wstep:w]
end

# ╔═╡ 0b9b8942-4b71-11eb-2cc2-6f4b17c490df
resizeto100(myimg)

# ╔═╡ a7440e4c-4ac0-11eb-010f-4d8bf6e12431
typeof(myimg)

# ╔═╡ 2908cda0-4ac4-11eb-0a77-db6cd3870e6b
myimg[1]

# ╔═╡ d1837178-4ac0-11eb-2944-75f7bf3932f0
allpixels = myimg[:];

# ╔═╡ 7a436504-4ac4-11eb-0929-f70f28d99137
length(allpixels)

# ╔═╡ b6e3da82-4ac1-11eb-1f99-2595ab28146c
typeof(allpixels)

# ╔═╡ 2655971c-4ac1-11eb-1807-ad5d872b702f
function uniquecolors(arr)
	colorsfound = []
	for p in arr
		if p ∉ colorsfound
			push!(colorsfound, p)
		end
	end
	colorsfound
end

# ╔═╡ f2a56694-4ac3-11eb-3b63-a937050b6a95
uniquecolors(allpixels)

# ╔═╡ Cell order:
# ╠═b01f28bc-4abe-11eb-0001-77fa8af80c96
# ╠═cd0711f8-4abe-11eb-2eba-a5ab1ec99282
# ╠═9f6040ba-4abe-11eb-2890-999a852ae83d
# ╠═aa746916-4b6f-11eb-0587-cdfd14c66b77
# ╠═0b9b8942-4b71-11eb-2cc2-6f4b17c490df
# ╠═a7440e4c-4ac0-11eb-010f-4d8bf6e12431
# ╠═2908cda0-4ac4-11eb-0a77-db6cd3870e6b
# ╠═d1837178-4ac0-11eb-2944-75f7bf3932f0
# ╠═7a436504-4ac4-11eb-0929-f70f28d99137
# ╠═b6e3da82-4ac1-11eb-1f99-2595ab28146c
# ╠═2655971c-4ac1-11eb-1807-ad5d872b702f
# ╠═f2a56694-4ac3-11eb-3b63-a937050b6a95
