#!/usr/bin/env bash

check_package() {
    local package=$1
    local result=$(nix-search -j "$package" | jq -r --arg pkg "$package" '
        select(.package_pname == $pkg or .package_attr_name == $pkg) | .package_pname
    ')
    if [ -z "$result" ]; then
        echo "$package"
    fi
}

# Check if flake.nix exists
if [ ! -f flake.nix ]; then
    echo "Error: flake.nix not found in the current directory"
    exit 1
fi

# Extract package names from flake.nix
packages=$(awk '/name = "global-packages";/,/];/' flake.nix |
    sed -n '/paths = with pkgs; \[/,/];/p' |
    grep -v 'paths = with pkgs; \[' |
    grep -v '];' |
    sed 's/^[[:space:]]*//' |
    sed 's/#.*$//' |
    sed '/^$/d')

# Array to store packages without a match
not_found=()

# Counter for progress
total_packages=$(echo "$packages" | wc -l)
current=0

# Check each package
while IFS= read -r package; do
    # Trim whitespace
    package=$(echo "$package" | xargs)
    # Skip empty lines
    [[ -z "$package" ]] && continue

    # Increment counter
    ((current++))

    # Show progress
    echo -ne "Checking package $current of $total_packages: $package\r"

    result=$(check_package "$package")
    if [ -n "$result" ]; then
        not_found+=("$result")
    fi

    # Add a small delay to avoid overwhelming the system
    sleep 0.2
done <<<"$packages"

echo # New line after progress indicator

# Print packages without a direct match
if [ ${#not_found[@]} -eq 0 ]; then
    echo "All packages have a direct match"
else
    echo "Packages without a direct match:"
    printf '%s\n' "${not_found[@]}"
fi
