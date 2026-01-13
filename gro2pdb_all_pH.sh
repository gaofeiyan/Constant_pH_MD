#!/bin/bash

for dir in pH_*/; do
    cd "$dir" || continue

    ph_name=$(basename "$dir")
    gro_file="${ph_name}_10.gro"
    pdb_file="${ph_name}_10.pdb"

    if [[ -f "$gro_file" ]]; then
        echo "Converting $dir$gro_file → $pdb_file"
        gmx editconf -f "$gro_file" -o "$pdb_file"
    else
        echo "Warning: $gro_file not found in $dir"
    fi

    cd ..
done
