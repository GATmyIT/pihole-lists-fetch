## pihole-lists-fetch
Fetches publicly published Pi-Hole blacklists (to act as a mirror)

## About
Iterative bash script pulling comma separated URLs and Output Path from url_list.txt

Specify the -v (verbose) flag for output with verbosity!

*blacklist_lists.txt* format example
```
   http://www.host.com/path/file.html,output/folder/path.extension
```
Prefer absolute output path in case the working directory changes

## Using
1. Download the latest release
2. Extract the folder in your desired location.
3. Open a shell session, and run: ```sh first_run.sh```
4. To update lists, run ```sh fetch_list_updatess.sh```

All your lists are located in the ```output``` folder