using Test
using DrWatson

dir = projectdir("scripts-solutions")
for file in readdir(dir)
  if endswith(file, ".jl")
    module_name = replace(file, ".jl" => "")
    module_file = "$(module_name)_test.jl"
    content = read(joinpath(dir, file), String)
    content = string("module $(module_name) \n", content, "\n end")
    write(joinpath("test", module_file), content)

    @testset "$(module_name) tests" begin
      include(module_file)
    end
  end
end
