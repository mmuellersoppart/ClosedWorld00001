# ClosedWorld #00001

One of the simplest worlds imagineable. 

Each color pixel represents a species. 
The food chain is circular. In a world with 3 colors the law would be...
1 eats 2 and 2 eats 3 and 3 eats 1. 

## How to run.

1. Place a single world (image) in the world directory. Be sure the extension is included in the name "world1.png"

>  e.g. ./world/world1.png

2. Rev up REPL
3. activate the environment

```
pkg> activate .
```

>to get  pkg> hit the key ']'.

### CLI

1. julia> include("closedworld00001.jl)
2. julia> closedworld.runworld(num_iterations)

### or Pluto

1. julia> import Pluto
2. julia> Pluto.run()
3. from Pluto, open closedworld00001pluto.jl

After the instructions, a folder named output should appear with the state of the world for each iteration. 