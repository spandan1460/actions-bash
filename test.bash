changed_files=$(git log --name-only --pretty=format: --since="24 hours ago" main)
filtered_files=$(echo "$changed_files" | { grep '\.yml' || true; })
echo "$filtered_files"
count=$(echo ${#filtered_files})
echo "$count"
if [ $count -eq 0 ];
then 
 echo "exiting as no hostname since last 24 hours"
 exit 0;
fi
changed_files=$filtered_files
count=$(echo ${#changed_files})
mapfile -t array <<< "$changed_files"
echo "$array"
