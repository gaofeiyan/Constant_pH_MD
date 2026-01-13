#!/bin/bash

for dir in pH_*/; do
    cd "$dir" || continue

    ph_name=$(basename "$dir")
    pdb_file="${ph_name}_10.pdb"

    if [[ -f "$pdb_file" ]]; then
        echo "Running PROPKA on $dir$pdb_file"
        propka3 "$pdb_file"
    else
        echo "Warning: $pdb_file not found in $dir"
    fi

    cd ..
done
