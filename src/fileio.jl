
function fileio_save(f::File{format"TOMO.H5"},meta_info::AbstractDict{<:AbstractString}, dataset::AbstractDict{<:AbstractString,<:AbstractArray};kwargs...)
    h5open(FileIO.filename(f), "w") do file
        meta_group = create_group(file,"Description")
        for (name, data) in meta_info
            dset = create_dataset(meta_group, name, datatype(data), dataspace(data))
            write(dset, data)
        end
        for (name,data) in dataset
            dset = create_dataset(file, name, datatype(data), dataspace(data);
                                kwargs...)
            write(dset, data)
        end
    end
end

function fileio_load(f::File{format"TOMO.H5"})
    h5open(FileIO.filename(f), "r") do file
        meta_info = Dict{String,Any}()
        meta_group = file["Description"]
        for name in keys(meta_group)
            meta_info[name] = read(meta_group[name])
        end
        dataset = Dict{String,AbstractArray}()
        for name in keys(file)
            if isa(file[name],HDF5.Group)
                continue
            end
            dataset[name] = read(file[name])
        end
        meta_info, dataset
    end
end
