module GridapDD29Workshop

deps_jl = joinpath(@__DIR__, "..", "deps", "deps.jl")

if !isfile(deps_jl)
  s = """
  Package GridapDD29Workshop not installed properly.
  Run Pkg.build(\"GridapDD29Workshop\"), restart Julia and try again
  """
  error(s)
end

include(deps_jl)

end
