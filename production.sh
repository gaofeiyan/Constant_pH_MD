#!/usr/bin/env bash
set -e

# ===== 参数 =====
rep_info="0.00 1.00 2.00 3.00 4.00 5.00 6.00 7.00 8.00 9.00 10.00 11.00 12.00"
cntmax=10

# ===== Production =====
for ((cnt=1; cnt<=cntmax; cnt++)); do
    pcnt=$((cnt-1))

    for pH in ${rep_info}; do
        dir="pH_${pH}"
        istep="pH_${pH}_${cnt}"
        pstep="pH_${pH}_${pcnt}"

        echo "=== pH ${pH}, segment ${cnt} ==="

        if [ ${cnt} -eq 1 ]; then
            # 第 1 段：从 pH_X.XX_0.gro 起步
            sh sed.sh ${dir}/pH_${pH}_0.gro

            gmx grompp \
                -f pH_${pH}.mdp \
                -o ${dir}/${istep}.tpr \
                -c ${dir}/pH_${pH}_0.gro \
                -p topol.top \
                -n index.ndx \
                -maxwarn 999
        else
            # 后续段：接上一段
            sh sed.sh ${dir}/${pstep}.gro

            gmx grompp \
                -f pH_${pH}.mdp \
                -o ${dir}/${istep}.tpr \
                -c ${dir}/${pstep}.gro \
                -t ${dir}/${pstep}.cpt \
                -p topol.top \
                -n index.ndx \
                -maxwarn 999
        fi

        gmx mdrun -v -deffnm ${dir}/${istep}
    done
done
