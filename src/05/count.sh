total_folders=$(( $(find $1 -type d | wc -l) - 1 ))
echo "Total number of folders (including all nested ones) = $total_folders"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top_folders=""
if [ $total_folders -ge 1 ]; then
        top_folders=$(find $1* -type d -exec du -h {} +| sort -rh | head -n 5 | awk '{print NR " - " $2 ", " $1"B"}')
        top_folders+="\n"
fi
echo -ne "$top_folders"

total_files=$(find $1 -type f | wc -l)
echo "Total number of files = $total_files"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $1 -type f -name "*.conf" | wc -l)"
echo "Text files = $(find $1 -type f -name "*.txt" | wc -l)"
total_exec=$(find $1 -type f -exec file {} + | grep -c 'executable')
echo "Executable files = $total_exec"
echo "Log files (with the extension .log) = $(find $1 -type f -name "*.log" | wc -l)"
echo "Archive files = $(find $1 -type f -exec file {} + | grep -c 'compressed')"
echo "Symbolic links = $(find $1 -type l | wc -l)"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"

top_file_list=$(find $1 -type f -exec du -ah {} + | sort -rh | head -n 10)
top_files=""
if [ $total_files -ge 1 ]; then
	count=1
	while IFS= read -r line; do
		file_size=$(echo "$line" | awk '{print $1}')
		file_name=$(echo "$line" | awk '{print $2}')
		file_extension=$(basename "$file_name" | awk -F '.' '{if (NF>1) print ", " $NF}')
		
		file_info="$file_name, $file_size"B"$file_extension"
		top_files+="$count - $file_info\n"
		((count++))
	done <<< "$top_file_list"
fi
echo -en "$top_files"

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"

top_executables=$(find $1 -type f -exec file {} + | grep 'executable' | awk -F: '{print $1}' | xargs du -ah | sort -rh | head -n 10)

calculate_md5() {
	md5sum $1 | awk '{print $1}'
}

top_executables_with_md5=""
if [ $total_exec -ge 1 ]; then
	count=1
	while read -r file_size file_path; do
		md5_hash=$(calculate_md5 "$file_path")
		top_executables_with_md5+="$count - $file_path, $file_size"B", $md5_hash\n"
		((count++))
	done <<<"$top_executables"
fi

echo -en "$top_executables_with_md5"
