
STR="cloudinary-misha/node-tests-lab,cloudinary-misha/node-tests-lab2"
IFS=','
for repo in $STR; do
  echo $repo
done

########## LOPPING OVER ARRAYS ########
FOLDERS_TO_CHECK=("/tmp" "/dev")

for FOLDER in "${FOLDERS_TO_CHECK[@]}"; do
  echo "$FOLDER"
done


BUILD_TRAVIS=true
if [ "$BUILD_TRAVIS" = true ]; then
  echo "is true"
else
  echo "is false"
fi


########## SHORTHAND CONDITIONAL ########

[ -z "$VAR1" ] && "echo exist" || echo "exist"