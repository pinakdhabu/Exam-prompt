# How to Add Your University

> 🎯 **Goal:** Make your university work with all 30 Exam Prompt skills in under 5 minutes.

## Quick Start (3 Steps)

### Step 1: Fork the Repo

```bash
git clone https://github.com/pinakdhabu/Exam-prompt.git
cd Exam-prompt
```

### Step 2: Create Your University Folder

```bash
# Copy the template
cp -r universities/_TEMPLATE_ universities/YOUR_UNIVERSITY_FULL_NAME

# Fill in your details
# See: universities/YOUR_UNIVERSITY_FULL_NAME/config.json
```

### Step 3: Fill the Config

Edit `universities/YOUR_UNIVERSITY_FULL_NAME/config.json`:

```json
{
  "id": "your-university",
  "full_name": "Your University Full Name",
  "short_name": "YUNI",
  "country": "Your Country",
  "exam_system": "semester",
  "patterns": {
    "default": "2024",
    "available": [
      {
        "id": "2024",
        "name": "2024 Pattern",
        "total_units": 5,
        "or_pairs": 5,
        "total_marks": 70,
        "time_hours": 2.5
      }
    ]
  }
}
```

### That's It!

The system auto-detects your university from the folder name. Run:

```bash
bash scripts/init-project.sh
```

---

## Example: Adding SPPU Computer Engineering Subjects

To add detailed subject data for a branch:

1. Create `branches/COMPUTER_ENGINEERING/subjects.json`
2. List your subjects with units and topics
3. Optionally add PYQ PDFs in the `PYQs/` directory

---

## Contributing Back

1. Fork the repo
2. Add your university
3. Open a Pull Request

All universities are welcome — public, private, government, international.

---

## Need Help?

Open an issue at https://github.com/pinakdhabu/Exam-prompt/issues
