import os
import sys
import shutil

def rename_project(new_name):
    old_name = "CaptainsLog"
    old_bundle_id = "danigp.es.CaptainsLog"
    new_bundle_id = f"danigp.es.{new_name}"
    
    print(f"🚀 Renaming project from {old_name} to {new_name}...")

    # 1. Rename directories and files
    for root, dirs, files in os.walk(".", topdown=False):
        # Rename files
        for name in files:
            if old_name in name:
                old_path = os.path.join(root, name)
                new_path = os.path.join(root, name.replace(old_name, new_name))
                os.rename(old_path, new_path)
                print(f"  📄 Renamed file: {name} -> {os.path.basename(new_path)}")

        # Rename directories
        for name in dirs:
            if old_name in name:
                old_path = os.path.join(root, name)
                new_path = os.path.join(root, name.replace(old_name, new_name))
                os.rename(old_path, new_path)
                print(f"  📁 Renamed directory: {name} -> {os.path.basename(new_path)}")

    # 2. Update file contents
    for root, dirs, files in os.walk("."):
        if ".git" in root or ".build" in root or "scripts" in root:
            continue
            
        for name in files:
            if name.endswith((".swift", ".plist", ".pbxproj", ".sharedscheme", ".md", ".json")):
                path = os.path.join(root, name)
                try:
                    with open(path, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    new_content = content.replace(old_name, new_name)
                    new_content = new_content.replace(old_bundle_id, new_bundle_id)
                    
                    if new_content != content:
                        with open(path, 'w', encoding='utf-8') as f:
                            f.write(new_content)
                        print(f"  📝 Updated contents: {path}")
                except Exception as e:
                    print(f"  ⚠️ Could not process {path}: {e}")

    print(f"\n✅ Done! Project successfully renamed to {new_name}.")
    print("👉 Next steps:")
    print(f"1. Open {new_name}.xcodeproj in Xcode.")
    print("2. If necessary, update the Development Team in Signing & Capabilities.")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 scripts/rename_project.py NewProjectName")
        sys.exit(1)
    
    rename_project(sys.argv[1])
