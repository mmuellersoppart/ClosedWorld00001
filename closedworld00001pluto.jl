### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ 8f6b396a-4b79-11eb-274f-535b68be1d53
using Images, FileIO

# ╔═╡ 72063b36-4b79-11eb-3af1-1d5c0442b7ec
md"# Closed World #00001"

# ╔═╡ d03d6ba2-4b79-11eb-1705-897a476173f9
md"### find world"

# ╔═╡ 9b596df0-4b79-11eb-2ddf-15c47b0ebc58
begin
	worldpath = ""
	worldpath = begin
    	    files = readdir("./world", join=true)
	        isempty(files) && throw(ErrorException("ERROR: put a world (img) in the world folder."))
			if files[1] == "./world/.DS_Store"
				files[2]
			else
				files[1]
		end
	end
end


# ╔═╡ e03935ae-4b79-11eb-3364-b31697dfdbd4
md"### load world"

# ╔═╡ f54ddb20-4b79-11eb-0d89-6594ed3d379c
begin
	# delete old output
	outputpath = mkpath("./output/");
	rm(outputpath, recursive=true, force=true);
	
	# load new world and place in output folder
	world = load(worldpath);
	save("./output/0.png", world);
end

# ╔═╡ 7dc0a53c-4b82-11eb-22c9-cf3b25169686
(worldh, worldw) = size(world)

# ╔═╡ 1660afd4-4b7a-11eb-2c03-f13900e368c8
function resizebasic(img, hstep, wstep)
        (h, w) = size(img)
        img_small = copy(img)
        return img_small[1:hstep:h, 1:wstep:w]
end

# ╔═╡ 2215c67c-4b7a-11eb-3068-c7f8223dda71
md"your little world"

# ╔═╡ 333ec052-4b7a-11eb-1778-a703a7c682d7
resizebasic(world, 3, 3)

# ╔═╡ 3ea1c048-4b7a-11eb-3013-834de4594c87
md"### list species on planet"

# ╔═╡ 5594030e-4b7a-11eb-11e0-b9cec17821d9
specieslist = begin

	allpixels = world[:];

	function uniquecolors(arr)
    	    colorsfound = []
        	for p in arr
            	    if p ∉ colorsfound
                	        push!(colorsfound, p)
                	end
        	end
        	colorsfound
	end

	uniquecolors(allpixels)
end

# ╔═╡ c9767874-4b7f-11eb-3f3c-1b89b3c45253
numspecies = length(specieslist)

# ╔═╡ 799c94dc-4b7a-11eb-0f59-1505a7c3fc58
md"### Define the laws of this world."

# ╔═╡ 061a045a-4b7b-11eb-0a55-7df77323f295
md"#### law one, the food chain"

# ╔═╡ a69c7350-4b7f-11eb-0fbd-ab312bd17f31
#default
foodchain = collect(1:numspecies)
#custom
# foodchain = [2, 1]	

# ╔═╡ 354a56f8-4b7b-11eb-073e-f5048ee02be8
newspecieslist = begin
	
	function rearrangelist(foodchain, specieslist)
       	if Set(foodchain) ≠ Set(collect(1:length(specieslist)))
				throw(ErrorException("ERROR: foodchain will not work"))
			end
		
		
		newspecieslist = copy(specieslist)
		
	    for (i, sp) in enumerate(foodchain)
					newspecieslist[i] = specieslist[sp]
		end
		
		newspecieslist
	end
	
	rearrangelist(foodchain, specieslist)
	
end						

# ╔═╡ 92f23a9c-4b84-11eb-039e-e92db7a644f4
foodchaindict = Dict([newspecieslist[speciesid] => speciesid for speciesid in 1:numspecies])

# ╔═╡ 3bd029f8-4b80-11eb-3c94-f39a8dc56feb
md"## run the world"

# ╔═╡ 568b6848-4b80-11eb-32a2-3907015869cf
numberofiterations = 200

# ╔═╡ 5ea1c496-4b80-11eb-21f0-81251da0f6f0
saveoldworlds = true

# ╔═╡ 1f7c62f4-4b89-11eb-1891-c5ea4f2859e0
function getpredator(species, foodchaindict)
	speciesid = foodchaindict[species]
	predatorid = speciesid + 1
	if predatorid > length(newspecieslist)
		newspecieslist[1]
	else
		newspecieslist[predatorid]
	end
end
	

# ╔═╡ 2c173618-4b8b-11eb-1a77-b3d200bbad9c
function ispredatornearby(world, predator, ih, iw)
	left = if (iw - 1 == 0) Tuple([ih, worldw]) else Tuple([ih, iw - 1]) end
	right = if (iw + 1 > worldw) Tuple([ih, 1]) else Tuple([ih, iw + 1]) end
	
	up = if (ih - 1 == 0) Tuple([worldh, iw]) else Tuple([ih - 1, iw]) end
	down = if (ih + 1 > worldh) Tuple([1, iw]) else Tuple([ih + 1, iw]) end
	
	for loc in [left, right, up, down]
		if world[loc[1], loc[2]] == predator
			return true
		end
	end
	
	false
end
	

# ╔═╡ 70df1a98-4b80-11eb-2d16-39150d710be9
for i in 1:numberofiterations
	
	oldworldfilename = string(i - 1) * ".png"
	newworldfilename = string(i) * ".png"
	basepath = "./output/"
	
	#load previous world
	oldworld = load(basepath * oldworldfilename)
	
	#operations
	newworld = copy(oldworld)
	
	for ih in 1:worldh
		for iw in 1:worldw
			currspecies = oldworld[ih, iw]
			predator = getpredator(currspecies, foodchaindict)
			if ispredatornearby(oldworld, predator, ih, iw) 
				newworld[ih, iw] = predator
			end
		end
	end
	
	#save new world
	save(basepath * newworldfilename, newworld)
end

# ╔═╡ 072fdf0a-4b91-11eb-1397-b192df4a268a


# ╔═╡ Cell order:
# ╟─72063b36-4b79-11eb-3af1-1d5c0442b7ec
# ╠═8f6b396a-4b79-11eb-274f-535b68be1d53
# ╟─d03d6ba2-4b79-11eb-1705-897a476173f9
# ╠═9b596df0-4b79-11eb-2ddf-15c47b0ebc58
# ╟─e03935ae-4b79-11eb-3364-b31697dfdbd4
# ╠═f54ddb20-4b79-11eb-0d89-6594ed3d379c
# ╠═7dc0a53c-4b82-11eb-22c9-cf3b25169686
# ╠═1660afd4-4b7a-11eb-2c03-f13900e368c8
# ╟─2215c67c-4b7a-11eb-3068-c7f8223dda71
# ╠═333ec052-4b7a-11eb-1778-a703a7c682d7
# ╟─3ea1c048-4b7a-11eb-3013-834de4594c87
# ╟─5594030e-4b7a-11eb-11e0-b9cec17821d9
# ╟─c9767874-4b7f-11eb-3f3c-1b89b3c45253
# ╟─799c94dc-4b7a-11eb-0f59-1505a7c3fc58
# ╟─061a045a-4b7b-11eb-0a55-7df77323f295
# ╠═a69c7350-4b7f-11eb-0fbd-ab312bd17f31
# ╟─354a56f8-4b7b-11eb-073e-f5048ee02be8
# ╟─92f23a9c-4b84-11eb-039e-e92db7a644f4
# ╟─3bd029f8-4b80-11eb-3c94-f39a8dc56feb
# ╠═568b6848-4b80-11eb-32a2-3907015869cf
# ╟─5ea1c496-4b80-11eb-21f0-81251da0f6f0
# ╠═1f7c62f4-4b89-11eb-1891-c5ea4f2859e0
# ╠═2c173618-4b8b-11eb-1a77-b3d200bbad9c
# ╠═70df1a98-4b80-11eb-2d16-39150d710be9
# ╟─072fdf0a-4b91-11eb-1397-b192df4a268a
