#!/bin/bash

# Stop on error
set -e

echo "🔧 Installing Flutter..."
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:$(pwd)/flutter/bin"

echo "🩺 Running Flutter doctor..."
flutter doctor

echo "🔑 Injecting TMDB API key..."
sed -i 's/REPLACE_TMDB_API_KEY/'"$TMDB_API_KEY"'/g' web/index.html

echo "🛠 Building Flutter Web..."
flutter build web --web-renderer html

echo "✅ Build complete."
