detect_tomoh5(io) =  FileIO.detecthdf5(io) && endswith(io.name,".tomoh5>")
add_format(format"TOMO.H5",detect_tomoh5, [".tomoh5"], [:TomoTemplates => UUID("7e1ec130-18a1-4273-abbb-9e85dadd9851")])
