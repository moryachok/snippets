-eq # equal
-ne # not equal
-lt # less than
-le # less than or equal
-gt # greater than
-ge # greater than or equal

if [ "$a" -gt "$b" ]; then
    ...
fi


STR="repo1,repo2"
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


