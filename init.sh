#!/bin/sh

function setup() {

    dirs=()
    dirs=("${dirs[@]}" "Scenes")
    dirs=("${dirs[@]}" "Prefabs")
    dirs=("${dirs[@]}" "Scripts")
    dirs=("${dirs[@]}" "Animations")
    dirs=("${dirs[@]}" "Materials")
    dirs=("${dirs[@]}" "Physics Materials")
    dirs=("${dirs[@]}" "Fonts")
    dirs=("${dirs[@]}" "Textures")
    dirs=("${dirs[@]}" "Audio")
    dirs=("${dirs[@]}" "Resources")
    dirs=("${dirs[@]}" "Editor")
    dirs=("${dirs[@]}" "Plugins")

    for var in "${dirs[@]}"; do
        mkdir Assets/$1/"$var"
    done

cat << EOT > .gitignore
/[Ll]ibrary/
/[Tt]emp/
/[Oo]bj/
/[Bb]uild/
/[Bb]uilds/
/[Ll]ogs/
/Assets/AssetStoreTools*

# Autogenerated VS/MD solution and project files
ExportedObj/
*.csproj
*.unityproj
*.sln
*.suo
*.tmp
*.user
*.userprefs
*.pidb
*.booproj
*.svd

# Unity3D generated meta files
*.pidb.meta

# Unity3D Generated File On Crash Reports
sysinfo.txt

# Builds
*.apk
*.unitypackage

# Visual Studio
.vs
Release/
Debug/
EOT

cat << EOT > .gitattributes
## Unity ##

*.cs diff=csharp text
*.cginc text
*.shader text

*.mat merge=unityyamlmerge eol=lf
*.anim merge=unityyamlmerge eol=lf
*.unity merge=unityyamlmerge eol=lf
*.prefab merge=unityyamlmerge eol=lf
*.physicsMaterial2D merge=unityyamlmerge eol=lf
*.physicMaterial merge=unityyamlmerge eol=lf
*.asset merge=unityyamlmerge eol=lf
*.meta merge=unityyamlmerge eol=lf
*.controller merge=unityyamlmerge eol=lf


## git-lfs ##

#Image
*.jpg filter=lfs diff=lfs merge=lfs -text
*.jpeg filter=lfs diff=lfs merge=lfs -text
*.png filter=lfs diff=lfs merge=lfs -text
*.gif filter=lfs diff=lfs merge=lfs -text
*.psd filter=lfs diff=lfs merge=lfs -text
*.ai filter=lfs diff=lfs merge=lfs -text

#Audio
*.mp3 filter=lfs diff=lfs merge=lfs -text
*.wav filter=lfs diff=lfs merge=lfs -text
*.ogg filter=lfs diff=lfs merge=lfs -text

#Video
*.mp4 filter=lfs diff=lfs merge=lfs -text
*.mov filter=lfs diff=lfs merge=lfs -text

#3D Object
*.FBX filter=lfs diff=lfs merge=lfs -text
*.fbx filter=lfs diff=lfs merge=lfs -text
*.blend filter=lfs diff=lfs merge=lfs -text
*.obj filter=lfs diff=lfs merge=lfs -text

#ETC
*.a filter=lfs diff=lfs merge=lfs -text
*.exr filter=lfs diff=lfs merge=lfs -text
*.tga filter=lfs diff=lfs merge=lfs -text
*.pdf filter=lfs diff=lfs merge=lfs -text
*.zip filter=lfs diff=lfs merge=lfs -text
*.dll filter=lfs diff=lfs merge=lfs -text
*.unitypackage filter=lfs diff=lfs merge=lfs -text
*.aif filter=lfs diff=lfs merge=lfs -text
*.ttf filter=lfs diff=lfs merge=lfs -text
*.rns filter=lfs diff=lfs merge=lfs -text
*.reason filter=lfs diff=lfs merge=lfs -text
*.lxo filter=lfs diff=lfs merge=lfs -text
EOT
}

if [ -e Assets ]; then
  echo -p "Enter this project name:" dir
  echo "Setup .gitignore and Asset directories."
  setup dir
  echo "done."
  echo ""
  echo "You should setup manually folloing steps."
  echo ""
  echo "1. Open Inspector [Edit] -> [Project Settings] -> [Editor]"
  echo "2. [Version Control] Mode to [Visible Meta Files]"
  echo "3. [Asset Serialization] Mode to [Force Text]"
  echo ""
fi