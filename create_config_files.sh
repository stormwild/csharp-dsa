#!/bin/bash

# Create files using dotnet new templates where available
if [ ! -f "global.json" ]; then
    echo "Creating global.json..."
    dotnet new globaljson
else
    echo "global.json already exists, skipping..."
fi

if [ ! -f "NuGet.config" ]; then
    echo "Creating NuGet.config..."
    dotnet new nugetconfig
else
    echo "NuGet.config already exists, skipping..."
fi

if [ ! -f ".editorconfig" ]; then
    echo "Creating .editorconfig..."
    dotnet new editorconfig
else
    echo ".editorconfig already exists, skipping..."
fi

if [ ! -f ".gitignore" ]; then
    echo "Creating .gitignore..."
    dotnet new gitignore
else
    echo ".gitignore already exists, skipping..."
fi

# Create Directory.Build.props if it doesn't exist
if [ ! -f "Directory.Build.props" ]; then
    echo "Creating Directory.Build.props..."
    dotnet new buildprops
else
    echo "Directory.Build.props already exists, skipping..."
fi

# Create Directory.Packages.props if it doesn't exist
if [ ! -f "Directory.Packages.props" ]; then
    echo "Creating Directory.Packages.props..."
    cat <<EOL >Directory.Packages.props
<Project>
  <PropertyGroup>
    <ManagePackageVersionsCentrally>true</ManagePackageVersionsCentrally>
    <!-- Add package management properties here -->
  </PropertyGroup>
</Project>
EOL
else
    echo "Directory.Packages.props already exists, skipping..."
fi

echo "Configuration files setup complete!"
