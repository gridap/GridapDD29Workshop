
# Going further

Due to time constraints, we have only been able to scratch the surface of what Gridap can do. This section provides additional resources and information for those who want to delve deeper into Gridap and its applications.

## Distributed computing and solvers

Gridap supports distributed computing through the [`GridapDistributed.jl`](https://github.com/gridap/GridapDistributed.jl). This package preserves (almost perfectly) the high-level interface of Gridap, allowing user to almost seamlessly parallelize their code accross multiple machines.

When going to parallel, however, scalable solvers are required to preserve the performance of the code. Gridap provides many tools to deal with distributed linear systems:

- [`GridapSolvers.jl`](https://github.com/gridap/GridapSolvers.jl) is our package for HPC solvers, built fully in Julia. It provides:
  - A collection of HPC-oriented preconditoned Krylov solvers.
  - An interface to design block-preconditioners.
  - A GMG preconditioner, with a set of smoothers for H1, HDiv and HCurl type of problems. This also comes with a generic API to deal with multi-level solvers.
- [`GridapPETSc.jl`](https://github.com/gridap/GridapPETSc.jl) is our interface to the [PETSc](https://petsc.org/release/) library, which provides a wide range of solvers and preconditioners. These can also be used in conjunction with the block-preconditioners of `GridapSolvers.jl`.

## Embedded methods

Embedded methods are a popular way of dealing with complex geometries. We provide a high order interface for these methods in the [`GridapEmbedded.jl`](https://github.com/gridap/GridapEmbedded.jl) package. This package allows you to define geometries using fuunctions and level-sets. Support for STL meshes is provides in the satellite package [`STLCutters.jl`](https://github.com/gridap/STLCutters.jl).

## Hybrid methods and polytopal meshes

Polytopal methods are another increasingly popular way of dealing with complex geometries. Recently, we have expanded the capabilities of Gridap towards hybrid non-confroming methods, such as HDG and HHO. This also include a high-level API to define and manipulate polytopal meshes. These functionalities are directly provided by `Gridap.jl`. We are planning to keep expanding these capabilities in the future, so stay tuned!

## Adaptive mesh refinement

Adaptive mesh refinement (AMR) is a powerful technique to improve the accuracy of numerical simulations by refining the mesh in regions where the solution is more complex. Gridap provides a high-level expandable API for refining and coarsening meshes, as well as support for AMR.
We also provide support for the well-known library [`p4est`](https://www.p4est.org/) through the package [`GridapP4est.jl`](https://github.com/gridap/GridapP4est.jl), which provides non-conforming highly efficient AMR on parallel distributed memory machines.

## Applications

Some repositories providing more advanced applications using `Gridap`:

- [Fluid-Structure Interaction](https://github.com/gridapapps/GridapFSI.jl)
- [Geosciences](https://github.com/gridapapps/GridapGeosciences.jl)
- [Magnetohydrodynamics](https://github.com/gridapapps/GridapMHD.jl)
- [Topology optimization](https://github.com/zjwegert/GridapTopOpt.jl)
