# World Tour - A4D Skills Sync

Automatically sync skills from the [AFV Library](https://github.com/forcedotcom/afv-library) into your local project.

## Quick Install

Run this one-liner to download and execute the sync script:

```bash
curl -fsSL https://raw.githubusercontent.com/flemx/world_tour/main/sync-skills.sh | bash
```

## Manual Installation

If you prefer to review the script before running:

```bash
# Download the script
curl -o sync-skills.sh https://raw.githubusercontent.com/flemx/world_tour/main/sync-skills.sh

# Make it executable
chmod +x sync-skills.sh

# Run it
./sync-skills.sh
```

## What It Does

The script will:
- Clone the skills directory from the [forcedotcom/afv-library](https://github.com/forcedotcom/afv-library/tree/main/skills) repository
- Copy all skills to `.a4drules/skills/` in your current directory
- Automatically clean up temporary files
- Display progress with color-coded output

## Requirements

- Git must be installed on your system
- Internet connection to access GitHub

## Usage

Once downloaded, you can run the script anytime to sync the latest skills:

```bash
./sync-skills.sh
```

## Output

The script will show:
- ✓ Progress messages during cloning and copying
- ✓ Number of skill files synced
- ✓ Success confirmation

## Troubleshooting

If you encounter permission issues:
```bash
chmod +x sync-skills.sh
```

If the `.a4drules/skills` directory doesn't exist, the script will create it automatically.

## Repository

[View on GitHub](https://github.com/flemx/world_tour)
