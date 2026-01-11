# Constant_pH_MD
create inputfiles from Charmm-GUI website, constant_pH function.

1. ./Pre_em.sh
2.    
```
 gmx make_ndx -f step6.6_equilibration_BUF.gro -n index.ndx
```

### SOLU_MEM (including protein and membrane)  SOLV (including all ions and solvate and BUF)


3. ## put step6.6_equilibration_BUF.gro into each pH folder as starting structure for production runs

### bash

```
for pH in 0.00 1.00 2.00 3.00 4.00 5.00 6.00 7.00 8.00 9.00 10.00 11.00 12.00
do
    cp step6.6_equilibration_BUF.gro pH_${pH}/pH_${pH}_0.gro
done
```

## run production.sh to start production runs in each pH folder
./production.sh


