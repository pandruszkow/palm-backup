# palm-backup
A Windows Batch script to back up the Palm Desktop data directories and files into an archive using 7-Zip. I consider this script feature-complete, if a bit clunky to configure.

Configurable options:
- Where the Palm Desktop application is installed (where the data is)
- Where the backup should go
- The HotSync profile name
- Archive compression level
- Whether or not a copy of the backup script is to be included in the archive

All backups are timestamped with the ISO8601-formatted datetime, and have a fixed prefix. The resulting archives amount to around 500 KiB on my machine, so keeping a full backup history should take up a negligible amount of space.

Potential new features:
- Pass in the HotSync profile name via a batch parameter
- Allow specifying a custom path and/or filename template via a batch parameter
- Make archive extension configurable in the config section
- Make the path to 7zip configurable in the config section
- Change "should include a copy of the script" into an optional batch flag, and stop including it by default
