on run
    set toRun to "${WINEPREFIX}/drive_c/Program Files/Winamp/winamp.exe"
    set winePrefix to "${WINEPREFIX}"
    set wineLocation to "/usr/local/bin"
    set dyldFallbackLibraryPath to "/opt/X11/lib"
    
    set toRunPath to do shell script "WINEPREFIX=\"" & winePrefix & "\"; TEMPVAR=\"" & toRun & "\"; echo \"${TEMPVAR%/*}\""
    set toRunFile to do shell script "WINEPREFIX=\"" & winePrefix & "\"; TEMPVAR=\"" & toRun & "\"; TEMPVAR2=\"" & toRunPath & "\"; echo \"${TEMPVAR#$TEMPVAR2/}\""
    do shell script "PATH=\"" & wineLocation & ":$PATH\"; export WINEPREFIX=\"" & winePrefix & "\"; export DYLD_FALLBACK_LIBRARY_PATH=\"" & dyldFallbackLibraryPath & "\"; export FREETYPE_PROPERTIES=truetype:interpreter-version=35; cd \"" & toRunPath & "\"; wine \"" & toRunFile & "\" > /dev/null 2>&1 &"
end run
