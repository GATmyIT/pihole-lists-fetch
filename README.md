#pihole-lists-fetch
Fetches publicly published Pi-Hole blacklists (to act as a mirror)

#About
Iterative bash script pulling comma separated URLs and Output Path from url_list.txt

Specify the -v (verbose) flag for output with verbosity!

url_list.txt format example
http://www.host.com/path/file.html,output/folder/path.extension

Prefer absolute output path in case the working directory changes