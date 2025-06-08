using Documenter
using Literate
using Printf
using DD29

repo_src = joinpath(@__DIR__,"..","src")
pages_dir = joinpath(@__DIR__,"src","pages")

models_src = joinpath(@__DIR__,"..","meshes")
models_dst = joinpath(@__DIR__,"src","meshes")

assets_src = joinpath(@__DIR__,"..","assets")
assets_dst = joinpath(@__DIR__,"src","assets")

Sys.rm(pages_dir;recursive=true,force=true)
Sys.rm(models_dst;recursive=true,force=true)
Sys.rm(assets_dst;recursive=true,force=true)

Sys.cp(models_src,models_dst)
Sys.cp(assets_src,assets_dst)

# Add index.md file as introduction to navigation menu
exercises = Pair{String, String}[]
tutorials = Pair{String, String}[]
for (i,filename) in enumerate(DD29.files)

  file = replace(filename, ".jl" => "")
  name = replace(filename, ".jl" => "", "_" => " ")
  is_exercise = startswith(name, "E")

  # Generate markdown
  function preprocess_docs(content)
    return content
  end
  Literate.markdown(joinpath(repo_src,filename), pages_dir; name=file, preprocess=preprocess_docs, codefence="```julia" => "```")

  path = joinpath("pages",string(file,".md"))
  if is_exercise
    push!(exercises, (name => path))
  else
    push!(tutorials, (name => path))
  end
end

readme_path = joinpath(@__DIR__,"..","README.md")
software_path = joinpath(@__DIR__,"src","software_install.md")
Sys.cp(readme_path, software_path; force=true)

pages = [
  "Introduction" => "index.md",
  "Software installation" => "software_install.md",
  "Tutorials" => tutorials,
  "Exercises" => exercises,
]

makedocs(
  sitename = "Gridap DD29 Workshop",
  format = Documenter.HTML(),
  pages = pages
)

deploydocs(
  repo = "github.com/gridap/GridapDD29Workshop.git"
)
