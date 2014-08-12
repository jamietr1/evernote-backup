-- PURPOSE: Export all notes in Evernote to an ENEX file so that
-- the notes can be backed up to an external drive or to the cloud

-- Change the path below to the location you want the notes to be exported
set f to "/Volumes/My Book/Data/Backup/Export.enex"

with timeout of (30 * 60) seconds
	tell application "Evernote"
		-- Set date to 1990 so it finds all notes
		set matches to find notes "created:19900101"
		-- export to file set above
		export matches to f
	end tell
end timeout

-- Compress the file so that there is less to backup to the cloud
set p to POSIX path of f
do shell script "/usr/bin/gzip " & quoted form of p