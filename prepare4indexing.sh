# A shell script used to prepare the corpus files for indexing.
# Generates word lists, annotates them, runs a convertor and puts
# the resulting JSON files to the appropriate folder.
START_TIME="$(date -u +%s)"
cd src_convertors

# Conversion to Tsakorpus JSON
python3 eaf2json.py
echo "Source conversion ready."
rm -rf ../corpus/winterschool2026
mkdir -p ../corpus/winterschool2026
mv corpus/json ../corpus/winterschool2026
ln -s corpus/media ../search/media/winterschool2026
END_TIME="$(date -u +%s)"
ELAPSED_TIME="$(($END_TIME-$START_TIME))"
echo "Corpus files prepared in $ELAPSED_TIME seconds, finishing now."
