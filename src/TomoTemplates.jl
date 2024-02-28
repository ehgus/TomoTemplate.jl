module TomoTemplates

using FileIO
using HDF5
using UUIDs: UUID
export FileIO

include("fileio.jl")
include("filters.jl")
function __init__()
    include(joinpath(@__DIR__,"registry.jl"))    
end

end # module TomoTemplates
