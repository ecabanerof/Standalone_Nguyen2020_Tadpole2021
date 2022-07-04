#!/bin/bash
# Written by Minh Nguyen and CBIG under MIT license: https://github.com/ThomasYeoLab/CBIG/blob/master/LICENSE.md
ROOTDIR=`readlink -f $0 | xargs dirname`/../
export PYTHONPATH=$PYTHONPATH:$ROOTDIR

mkdir -p outputRNN
'''
echo Constant baseline
for i in {0..9}; do
    python -m cbig.Nguyen2020.baseline_constant \
        --spreadsheet "$ROOTDIR"/data/TADPOLE_D1_D2.csv \
        --mask outputRNN/fold${i}_mask.csv \
        --out outputRNN/constant_prediction$i.csv

    python -m cbig.Nguyen2020.evaluation \
        --reference outputRNN/fold${i}_test.csv \
        --prediction outputRNN/constant_prediction$i.csv
done


echo SVM baseline
for i in {0..9}; do
    python -m cbig.Nguyen2020.baseline_svm \
        --spreadsheet "$ROOTDIR"/data/TADPOLE_D1_D2.csv \
        --mask outputRNN/fold${i}_mask.csv \
        --features "$ROOTDIR"/data/features \
        --agamma .01 --vgamma .01 \
        --out outputRNN/svm_prediction$i.csv

    python -m cbig.Nguyen2020.evaluation \
        --reference outputRNN/fold${i}_test.csv \
        --prediction outputRNN/svm_prediction$i.csv
done
'''

echo Constant baseline 1
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold0_mask.csv \
     --out outputRNN/constant_prediction1.csv
echo Constant baseline 2
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold1_mask.csv \
     --out outputRNN/constant_prediction2.csv
echo Constant baseline 3
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold2_mask.csv \
     --out outputRNN/constant_prediction3.csv
echo Constant baseline 4
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold3_mask.csv \
     --out outputRNN/constant_prediction4.csv
echo Constant baseline 5
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold4_mask.csv \
     --out outputRNN/constant_prediction5.csv
echo Constant baseline 6
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold5_mask.csv \
     --out outputRNN/constant_prediction6.csv
echo Constant baseline 7
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold6_mask.csv \
     --out outputRNN/constant_prediction7.csv
echo Constant baseline 8
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold7_mask.csv \
     --out outputRNN/constant_prediction8.csv
echo Constant baseline 9
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold8_mask.csv \
     --out outputRNN/constant_prediction9.csv
echo Constant baseline 10
python -m cbig.Nguyen2020.baseline_constant \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold9_mask.csv \
     --out outputRNN/constant_prediction10.csv

python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold0_test.csv --prediction outputRNN/constant_prediction1.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold1_test.csv --prediction outputRNN/constant_prediction2.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold2_test.csv --prediction outputRNN/constant_prediction3.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold3_test.csv --prediction outputRNN/constant_prediction4.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold4_test.csv --prediction outputRNN/constant_prediction5.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold5_test.csv --prediction outputRNN/constant_prediction6.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold6_test.csv --prediction outputRNN/constant_prediction7.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold7_test.csv --prediction outputRNN/constant_prediction8.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold8_test.csv --prediction outputRNN/constant_prediction9.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold9_test.csv --prediction outputRNN/constant_prediction10.csv

echo SVM baseline 1
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold0_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 2
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold1_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 3
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold2_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 4
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold3_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 5
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold4_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 6
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold5_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 7
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold6_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 8
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold7_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 9
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold8_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv
echo SVM baseline 10
python -m cbig.Nguyen2020.baseline_svm \
     --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
     --mask outputRNN/fold9_mask.csv \
     --features $ROOTDIR/data/features \
     --agamma .01 --vgamma .01 \
     --out outputRNN/svm_prediction.csv

python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold0_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold1_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold2_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold3_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold4_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold5_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold6_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold7_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold8_test.csv --prediction outputRNN/svm_prediction.csv
python -m cbig.Nguyen2020.evaluation --reference outputRNN/fold9_test.csv --prediction outputRNN/svm_prediction.csv


