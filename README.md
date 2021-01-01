# ClosedWorld #00001

One of the simplest worlds imagineable. 

Each color pixel represents a species. 
The food chain is circular. In a world with 3 colors the law would be...
1 eats 2 and 2 eats 3 and 3 eats 1. 

## How to run.

1. Rev up REPL
2. activate the environment

```
pkg> activate .
```

> One must be in the Ecosystem1 project folder to use '.' \
>>to get  pkg> hit the key ']'.

### CLI

1. julia> include("closedworld00001.jl)
2. julia> closedworld.runworld(iterations)

### or Pluto

1. julia> import Pluto
2. julia> Pluto.run()
3. from Pluto, open closedworld00001pluto.jl