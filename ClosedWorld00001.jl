

module closedworld
	using Images, FileIO, ImageInTerminal
	
	export runworld

	function runworld(epochs)
		
		# get world
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

		# delete old output
		outputpath = mkpath("./output/");
		rm(outputpath, recursive=true, force=true);
	
		# load new world and place in output folder
		world = load(worldpath);
		save("./output/0.png", world);
		(worldh, worldw) = size(world)
		
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

		numspecies = length(specieslist)

		foodchain = collect(1:numspecies)
		foodchaindict = Dict([specieslist[speciesid] => speciesid for speciesid in 1:numspecies])

		function getpredator(species, specieslist, foodchaindict)
			speciesid = foodchaindict[species]
			predatorid = speciesid + 1
			if predatorid > length(specieslist)
				specieslist[1]
			else
				specieslist[predatorid]
			end
		end

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
		
		numberofiterations = epochs
		for i in 1:numberofiterations
	
			oldworldfilename = string(i - 1) * ".png"
			newworldfilename = string(i) * ".png"
			basepath = "./output/"
			
			#load previous world
			oldworld = world
			
			#operations
			newworld = copy(oldworld)
			
			for ih in 1:worldh
				for iw in 1:worldw
					currspecies = oldworld[ih, iw]
					predator = getpredator(currspecies, specieslist, foodchaindict)
					if ispredatornearby(oldworld, predator, ih, iw) 
						newworld[ih, iw] = predator
					end
				end
			end
			
			#save new world
			save(basepath * newworldfilename, newworld)
			world = newworld
		end
	end
end


