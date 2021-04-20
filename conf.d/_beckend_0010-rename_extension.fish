#!/usr/bin/fish

function rename-extension --description 'Recursively rename file extensions'
    # Parse arguments
    argparse 'h/help' 'e-extension-match=' 't-extension-to=' -- $argv
    or return 1

    # Show help if requested
    if set -q _flag_help
        echo "Usage: rename_extension --extension-match EXT --extension-to EXT DIRECTORY"
        echo "Recursively renames file extensions in a directory"
        echo ""
        echo "Required arguments:"
        echo "  --extension-match EXT  Extension to find"
        echo "  --extension-to EXT     New extension"
        echo "  DIRECTORY              Target directory"
        echo ""
        echo "Options:"
        echo "  -h, --help            Show this help message"
        return 0
    end

    # Validate required arguments
    if not set -q _flag_extension_match
        echo "Error: --extension-match is required" >&2
        return 1
    end

    if not set -q _flag_extension_to
        echo "Error: --extension-to is required" >&2
        return 1
    end

    # Get directory (last positional argument)
    set -l dir $argv[-1]
    if not set -q dir[1]
        echo "Error: Directory argument is required" >&2
        return 1
    end

    # Check if directory exists
    if not test -d $dir
        echo "Error: Directory '$dir' does not exist" >&2
        return 1
    end

    # Count files that will be renamed
    set -l count (find $dir -type f -name "*.$_flag_extension_match" | wc -l)
    if test $count -eq 0
        echo "No files found with extension .$_flag_extension_match in $dir"
        return 0
    end

    echo "About to rename $count files from .$_flag_extension_match to .$_flag_extension_to in $dir"
    read -l -P "Continue? [y/N] " confirm
    if not string match -qi 'y*' $confirm
        echo "Aborted"
        return 0
    end

    # Perform the rename
    find $dir -type f -name "*.$_flag_extension_match" | while read -l file
        set -l new (string replace -r ".$_flag_extension_match\$" ".$_flag_extension_to" $file)
        mv -v "$file" "$new"
    end

    echo "Renaming complete"
end
