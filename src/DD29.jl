module DD29

deps_jl = joinpath(@__DIR__, "..", "deps", "deps.jl")

if !isfile(deps_jl)
  s = """
  Package DD29 not installed properly.
  Run Pkg.build(\"DD29\"), restart Julia and try again
  """
  error(s)
end

include(deps_jl)

end
