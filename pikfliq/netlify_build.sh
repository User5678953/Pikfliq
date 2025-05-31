#!/bin/bash
set -e

echo "🔧 Installing Flutter..."
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:$(pwd)/flutter/bin"

flutter doctor

echo "🛠 Building Flutter Web..."
flutter build web --web-renderer html

echo "🔑 Injecting TMDB API key..."
sed -i 's/REPLACE_TMDB_API_KEY/'"$TMDB_API_KEY"'/g' build/web/index.html
