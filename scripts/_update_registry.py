"""Auto-sync university-registry.json with filesystem state."""
import json, os, sys
from datetime import datetime

registry_path = sys.argv[1]
universities_dir = sys.argv[2]
dry_run = sys.argv[3] == 'true'
json_mode = sys.argv[4] == 'true'

# Load current registry
try:
    with open(registry_path) as f:
        data = json.load(f)
    if isinstance(data, dict):
        registry = data.get('universities', [])
        is_dict = True
    else:
        registry = list(data)
        is_dict = False
except (json.JSONDecodeError, FileNotFoundError):
    registry = []
    is_dict = False

# Scan disk
disk_dirs = set()
for d in sorted(os.listdir(universities_dir)):
    dpath = os.path.join(universities_dir, d)
    if os.path.isdir(dpath) and d not in ('_TEMPLATE_', 'scripts'):
        disk_dirs.add(d)

registry_by_dir = {u['directory']: u for u in registry}
added, removed, updated = [], [], []

for dir_name in sorted(disk_dirs):
    config_path = os.path.join(universities_dir, dir_name, 'config.json')
    patterns_dir = os.path.join(universities_dir, dir_name, 'patterns')
    branches_dir = os.path.join(universities_dir, dir_name, 'branches')
    pyqs_dir = os.path.join(universities_dir, dir_name, 'pyqs')

    config_exists = os.path.isfile(config_path)
    patterns_exists = os.path.isdir(patterns_dir) and bool(os.listdir(patterns_dir))
    branches_exists = os.path.isdir(branches_dir) and bool(os.listdir(branches_dir))
    pyqs_exists = os.path.isdir(pyqs_dir) and bool(os.listdir(pyqs_dir))

    if dir_name not in registry_by_dir:
        full_name = dir_name.replace('_', ' ').title()
        short_name, uni_type, country, uni_id = '', 'public', 'Unknown', ''
        if config_exists:
            try:
                cfg = json.load(open(config_path))
                full_name = cfg.get('full_name', full_name)
                short_name = cfg.get('short_name', '')
                uni_type = cfg.get('type', 'public')
                country = cfg.get('country', 'Unknown')
                uni_id = cfg.get('id', '')
            except Exception:
                pass
        if not uni_id:
            uni_id = dir_name.lower().replace('_', '-')
        entry = {
            'id': uni_id, 'directory': dir_name, 'full_name': full_name,
            'short_name': short_name, 'country': country, 'type': uni_type,
            'status': 'active' if config_exists else 'template-only',
            'maintained_by': None, 'config_exists': config_exists,
            'subjects_data': branches_exists, 'patterns_data': patterns_exists,
            'pyqs_available': pyqs_exists,
        }
        registry.append(entry)
        added.append(dir_name)
        print(f"NEW: {dir_name} ({full_name})")
    else:
        existing = registry_by_dir[dir_name]
        changes = []
        for key, val in [('config_exists', config_exists),
                         ('subjects_data', branches_exists),
                         ('patterns_data', patterns_exists),
                         ('pyqs_available', pyqs_exists)]:
            if existing.get(key) != val:
                changes.append(f"{key}: {existing.get(key)} -> {val}")
                existing[key] = val
        if existing.get('status') == 'template-only' and config_exists and patterns_exists:
            existing['status'] = 'active'
            changes.append("status: template-only -> active")
        if changes:
            updated.append({'dir': dir_name, 'changes': changes})
            print(f"UPDATED: {dir_name} -- {'; '.join(changes)}")

# Removed dirs
registry_dirs = {u['directory'] for u in registry}
for dir_name in sorted(registry_dirs - disk_dirs):
    if dir_name == '_TEMPLATE_':
        continue
    removed.append(dir_name)
    print(f"REMOVED: {dir_name} (no longer on disk)")

registry = [u for u in registry if u['directory'] in disk_dirs or u['directory'] == '_TEMPLATE_']
registry.sort(key=lambda x: x.get('full_name', '').lower())

if is_dict:
    data['universities'] = registry
    data['last_synced'] = datetime.now().isoformat()
    output = data
else:
    output = registry

if not dry_run:
    with open(registry_path, 'w') as f:
        json.dump(output, f, indent=2, ensure_ascii=False)
    print(f"\nWritten: {registry_path} ({len(registry)} universities)")
else:
    print(f"\n[DRY-RUN] Would write {registry_path} ({len(registry)} universities)")

if json_mode:
    print("---JSON---")
    print(json.dumps({'added': added, 'removed': removed, 'updated': updated, 'total': len(registry)}, indent=2))

if not added and not removed and not updated:
    print("No changes detected.")
