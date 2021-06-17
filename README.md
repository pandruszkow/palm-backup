# palm-backup
A Windows Batch script to back up the Palm Desktop data directories and files into an archive using 7-Zip. I consider this script feature-complete, if a bit clunky to configure.

Configurable options:
- Where the Palm Desktop application is installed (where the data is)
- Where the backup should go
- The HotSync profile name
- Archive compression level
- Whether or not a copy of the backup script is to be included in the archive

All backups are timestamped with the ISO8601-formatted datetime, and have a fixed prefix. The resulting archives amount to around 500 KiB on my machine, so keeping a full backup history should take up a negligible amount of space.

This script was only tested with Palm Desktop 4.1.4 as this is what I have installed. Feedback welcome on other versions.

Restoring from this script has **not** been tested yet, but I assume it would be as easy as unpacking all the PDB/PDC files manually from the archive, and applying to a freshly factory reset device using a newly installed copy of Palm Desktop.

Potential new features:
- Pass in the HotSync profile name via a batch parameter
- Allow specifying a custom path and/or filename template via a batch parameter
- Make archive extension configurable in the config section
- Make the path to 7zip configurable in the config section
- Change "should include a copy of the script" into an optional batch flag, and stop including it by default
