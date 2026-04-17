# Constant_pH_MD
create inputfiles from Charmm-GUI website, constant_pH function.

1. conda activate constantph

2. ./Pre_em.sh
3.    
```
 gmx make_ndx -f step6.6_equilibration_BUF.gro -n index.ndx
```

### SOLU_MEM (including protein and membrane)  SOLV (including all ions and solvate and BUF)


4. ## put step6.6_equilibration_BUF.gro into each pH folder as starting structure for production runs

### bash

```
for pH in pH_0.00 pH_1.00 pH_2.00 pH_3.00 pH_4.00 pH_5.00 pH_6.00 pH_7.00 pH_8.00 pH_9.00 pH_10.00 pH_11.00 pH_12.00
do
    cp step6.6_equilibration_BUF.gro pH_${pH}/pH_${pH}_0.gro
done
```

## run production.sh to start production runs in each pH folder
./production.sh


## Calculate Propka

chmod +x gro2pdb_all_pH.sh

./gro2pdb_all_pH.sh

chmod +x run_propka_all_pH.sh

./run_propka_all_pH.sh

