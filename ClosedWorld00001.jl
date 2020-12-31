using Images, FileIO, ImageInTerminal

function resizeto100(img)
        (h, w) = size(img)
    hstep = Int(100/h * h)
        wstep = Int(100/w * w)

        img_small = copy(img)
        return img_small[1:hstep:h, 1:wstep:w]
end


println("Welcome to Closed World #00001")

#get path of the world
worldpath = ""
worldpath = begin
	files = readdir("./world", join=true)
	isempty(files) && throw(ErrorException("ERROR: put a world (img) in the world folder."))
	files[1]
end

println("We found a world at $worldpath")

#load in image
world = load(worldpath)
smallworld = resizeto100(world)

println("Here's how it looks.")


#make image to linear array
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

#determine the species on the planet
println("Here are species we've found")
uniquecolors(allpixels)

5
