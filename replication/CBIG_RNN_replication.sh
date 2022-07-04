#!/bin/bash
# Written by Minh Nguyen and CBIG under MIT license: https://github.com/ThomasYeoLab/CBIG/blob/master/LICENSE.md
ROOTDIR=`readlink -f $0 | xargs dirname`/../
export PYTHONPATH=$PYTHONPATH:$ROOTDIR

mkdir -p outputLSTM

echo Generate 15 cross-validation folds
python -m cbig.Nguyen2020.gen_cv_fold \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --folds 15 \
    --outdir outputLSTM

echo Create training and test data, model filling
python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold0_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f0.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold1_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f1.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold2_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f2.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold3_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f3.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold4_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f4.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold5_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f5.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold6_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f6.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold7_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f7.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold8_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f8.pkl

python -m cbig.Nguyen2020.gen_cv_pickle \
    --spreadsheet $ROOTDIR/data/TADPOLE_D1_D2.csv \
    --features $ROOTDIR/data/features \
    --mask outputLSTM/fold9_mask.csv \
    --strategy model \
    --batch_size 128 \
    --out outputLSTM/test.f9.pkl

echo Train MinimalRNN model, first fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f0.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f0.pt

echo Train MinimalRNN model, second fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f1.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f1.pt

echo Train MinimalRNN model, 3 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f2.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f2.pt

echo Train MinimalRNN model, 4 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f3.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f3.pt

echo Train MinimalRNN model, 5 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f4.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f4.pt

echo Train MinimalRNN model, 6 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f5.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f5.pt

echo Train MinimalRNN model, 7 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f6.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f6.pt

echo Train MinimalRNN model, 8 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f7.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f7.pt

echo Train MinimalRNN model, 9 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f8.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f8.pt

echo Train MinimalRNN model, 10 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f9.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f9.pt
    
echo Train MinimalRNN model, 11 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f10.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f10.pt

echo Train MinimalRNN model, 12 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f11.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f11.pt

echo Train MinimalRNN model, 13 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f12.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f12.pt
    
echo Train MinimalRNN model, 14 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f13.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f13.pt

echo Train MinimalRNN model, 15 fold
python -m cbig.Nguyen2020.train --verbose \
    --data outputLSTM/test.f14.pkl \
    --i_drop 0.1 \
    --h_drop 0.4 \
    --h_size 128 \
    --nb_layers 2 \
    --epochs 100 --lr 0.001290666 --model LSTM --weight_decay 1e-5 \
    --out outputLSTM/model.f14.pt

echo Apply trained model on test set
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f0.pt --data outputLSTM/test.f0.pkl \
    -o outputLSTM/prediction_test.f0.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f1.pt --data outputLSTM/test.f1.pkl \
    -o outputLSTM/prediction_test.f1.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f2.pt --data outputLSTM/test.f2.pkl \
    -o outputLSTM/prediction_test.f2.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f3.pt --data outputLSTM/test.f3.pkl \
    -o outputLSTM/prediction_test.f3.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f4.pt --data outputLSTM/test.f4.pkl \
    -o outputLSTM/prediction_test.f4.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f5.pt --data outputLSTM/test.f5.pkl \
    -o outputLSTM/prediction_test.f5.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f6.pt --data outputLSTM/test.f6.pkl \
    -o outputLSTM/prediction_test.f6.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f7.pt --data outputLSTM/test.f7.pkl \
    -o outputLSTM/prediction_test.f7.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f8.pt --data outputLSTM/test.f8.pkl \
    -o outputLSTM/prediction_test.f8.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f9.pt --data outputLSTM/test.f9.pkl \
    -o outputLSTM/prediction_test.f9.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f10.pt --data outputLSTM/test.f10.pkl \
    -o outputLSTM/prediction_test.f10.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f11.pt --data outputLSTM/test.f11.pkl \
    -o outputLSTM/prediction_test.f11.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f12.pt --data outputLSTM/test.f12.pkl \
    -o outputLSTM/prediction_test.f12.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f13.pt --data outputLSTM/test.f13.pkl \
    -o outputLSTM/prediction_test.f13.csv
python -m cbig.Nguyen2020.predict --checkpoint outputLSTM/model.f14.pt --data outputLSTM/test.f14.pkl \
    -o outputLSTM/prediction_test.f14.csv

echo; echo Evaluation prediction on test set, first fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold0_test.csv --prediction outputLSTM/prediction_test.f0.csv
echo; echo Evaluation prediction on test set, second fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold1_test.csv --prediction outputLSTM/prediction_test.f1.csv
echo; echo Evaluation prediction on test set, 3 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold2_test.csv --prediction outputLSTM/prediction_test.f2.csv
echo; echo Evaluation prediction on test set, 4 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold3_test.csv --prediction outputLSTM/prediction_test.f3.csv
echo; echo Evaluation prediction on test set, 5 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold4_test.csv --prediction outputLSTM/prediction_test.f4.csv
echo; echo Evaluation prediction on test set, 6 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold5_test.csv --prediction outputLSTM/prediction_test.f5.csv
echo; echo Evaluation prediction on test set, 7 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold6_test.csv --prediction outputLSTM/prediction_test.f6.csv
echo; echo Evaluation prediction on test set, 8 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold7_test.csv --prediction outputLSTM/prediction_test.f7.csv
echo; echo Evaluation prediction on test set, 9 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold8_test.csv --prediction outputLSTM/prediction_test.f8.csv
echo; echo Evaluation prediction on test set, 10 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold9_test.csv --prediction outputLSTM/prediction_test.f9.csv
echo; echo Evaluation prediction on test set, 11 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold10_test.csv --prediction outputLSTM/prediction_test.f10.csv
echo; echo Evaluation prediction on test set, 12 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold11_test.csv --prediction outputLSTM/prediction_test.f11.csv
echo; echo Evaluation prediction on test set, 13 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold12_test.csv --prediction outputLSTM/prediction_test.f12.csv
echo; echo Evaluation prediction on test set, 14 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold13_test.csv --prediction outputLSTM/prediction_test.f13.csv
echo; echo Evaluation prediction on test set, 15 fold
python -m cbig.Nguyen2020.evaluation --reference outputLSTM/fold14_test.csv --prediction outputLSTM/prediction_test.f14.csv
