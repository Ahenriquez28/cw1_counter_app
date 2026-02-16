#!/bin/bash

# Initialize git repository
git init

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: Counter and Image Toggle App with all features"

# Add remote repository
git remote add origin https://github.com/Ahenriquez28/cw1_counter_app.git

# Push to main branch
git branch -M main
git push -u origin main

echo "Repository setup complete!"
echo "All files have been pushed to https://github.com/Ahenriquez28/cw1_counter_app"
