#!/bin/bash

OPT=$1

DATASET="dataset/iris.csv"
MODEL_DIR="model"
MODEL_NAME="iris_knn.pkl"
PYTHON_EXEC="/home/rohwid/PyEnvironment/test-3.9.6-all-packages/bin/python"

generate_timestamp() {
	orig="$(date)"
	epoch=$(date -d "${orig}" +"%s")
	epoch_to_date=$(date -d @$epoch +%Y%m%d_%H%M%S)
}

option() {
	echo "Continue traning? [Y/N] ${OPT}"

	case ${OPT} in
		Y)
			echo "Train again.."
			;;
		y)
			echo "Train again.."
			;;
		N)
			exit
			;;
		n)
			exit
			;;
		*)
			echo "[Error] Input invalid"
			exit
	esac
}


if [ $(ls | wc -l) -gt 0 ]; then
	echo "[Info] Training has done."
	option	
fi


if [ -f ${DATASET} ]; then
	${PYTHON_EXEC} train.py
else
	echo "[Error] Dataset not found."
fi

generate_timestamp
mv ${MODEL_DIR}/${MODEL_NAME} ${MODEL_DIR}/"${epoch_to_date}_${MODEL_NAME}"

