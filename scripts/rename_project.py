import os
import sys

def rename_project(new_name):
    old_name = "CaptainsLog"
    old_bundle_id = "danigp.es.CaptainsLog"
    new_bundle_id = f"danigp.es.{new_name}"
    
    print(f"🚀 Renaming project from {old_name} to {new_name}...")

    # 1. Rename directories and files
    # We collect all paths first to avoid changing the tree while walking
    paths_to_rename = []
    for root, dirs, files in os.walk(".", topdown=False):
        if ".git" in root or "scripts" in root:
            continue
            
        for name in files:
            if old_name in name:
                paths_to_rename.append((root, name))
        
        for name in dirs:
            if old_name in name:
                paths_to_rename.append((root, name))

    for root, name in paths_to_rename:
        old_path = os.path.join(root, name)
        new_path = os.path.join(root, name.replace(old_name, new_name))
        
        if os.path.exists(new_path) and old_path != new_path:
            print(f"  ⚠️ Skipping: {new_path} already exists.")
            continue
            
        try:
            os.rename(old_path, new_path)
            print(f"  ✅ Renamed: {name} -> {os.path.basename(new_path)}")
        except Exception as e:
            print(f"  ❌ Error renaming {old_path}: {e}")

    # 2. Update file contents
    for root, dirs, files in os.walk("."):
        if ".git" in root or ".build" in root or "scripts" in root:
            continue
            
        for name in files:
            if name.endswith((".swift", ".plist", ".pbxproj", ".sharedscheme", ".md", ".json", ".xcworkspacedata", ".yml")):
                path = os.path.join(root, name)
                # Important: The path might have been renamed in step 1, 
                # but os.walk continues with the old root name if we are not careful.
                # However, since we renamed files/folders in step 1, we should walk AGAIN.
                pass

    # Actually, let's walk again for contents to be sure we hit the new filenames
    for root, dirs, files in os.walk("."):
        if ".git" in root or ".build" in root or "scripts" in root:
            continue
        for name in files:
            if name.endswith((".swift", ".plist", ".pbxproj", ".sharedscheme", ".md", ".json", ".xcworkspacedata", ".yml")):
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
