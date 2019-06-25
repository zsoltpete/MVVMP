SOURCE_DIR=${PWD##*/}
PROJECT_PATH="$SOURCE_DIR.xcodeproj/project.pbxproj"
APPDELEGATE_PATH="$SOURCE_DIR/AppDelegate.swift"
#Gitignore és Podfile törlése
#Elhelyezése a fő könyvtárban kell hogy legyen
sed '/gitignore/d' $PROJECT_PATH > tmp.txt
mv tmp.txt $PROJECT_PATH
sed '/PodFile/d' $PROJECT_PATH > tmp.txt
mv tmp.txt $PROJECT_PATH

echo "💥 Removed Git ignore and podfile files references 💥"

#Letörli saját magát a project file-ból
#sed "/$new_project_post.sh/d" $PROJECT_PATH > tmp.txt
#mv tmp.txt $PROJECT_PATH

#echo "💥 Removed self reference from app 💥"

createGroupControllersPath() {
    local search="name = Controllers;"
    local replace="path = Controllers;"
    # Note the double quotes
    sed -i .bak "s/${search}/${replace}/g" $PROJECT_PATH
    rm $PROJECT_PATH.bak
}

createGroupControllersPath

#Adott group path módosítása
createGroupUtilitiesPath() {
    local search="name = Utilities;"
    local replace="path = Utilities;"
    # Note the double quotes
    sed -i .bak "s/${search}/${replace}/g" $PROJECT_PATH
    rm $PROJECT_PATH.bak
}

createGroupUtilitiesPath

createGroupModelsPath() {
    local search="name = Models;"
    local replace="path = Models;"
    # Note the double quotes
    sed -i .bak "s/${search}/${replace}/g" $PROJECT_PATH
    rm $PROJECT_PATH.bak
}

createGroupModelsPath

createGroupThemePath() {
    local search="name = Theme;"
    local replace="path = Theme;"
    # Note the double quotes
    sed -i .bak "s/${search}/${replace}/g" $PROJECT_PATH
    rm $PROJECT_PATH.bak
}

createGroupThemePath

createGroupRoutingPath() {
    local search="name = Routing;"
    local replace="path = Routing;"
    # Note the double quotes
    sed -i .bak "s/${search}/${replace}/g" $PROJECT_PATH
    rm $PROJECT_PATH.bak
}

createGroupRoutingPath

createGroupProtocolsPath() {
    local search="name = Protocols;"
    local replace="path = Protocols;"
    # Note the double quotes
    sed -i .bak "s/${search}/${replace}/g" $PROJECT_PATH
    rm $PROJECT_PATH.bak
}

createGroupProtocolsPath

echo "💥 Groups added 💥"

#Appdelegate modifying
modifyAppdelegate() {
    # Note the double quotes
    perl -pe 's/var window: UIWindow?/var window: UIWindow?\n\tvar guardWindow: UIWindow {\n\t\t\/\/swiftlint:disable force_unwrapping\n\t\treturn self.window!\n\t}\n\n\tstatic var shared: AppDelegate {\n\t\treturn UIApplication.shared.delegate as? AppDelegate ?? AppDelegate()\n\t}\n\n\tvar themeService = ThemeType.service(initial: .light)/' $APPDELEGATE_PATH > appdelegate.tmp
    mv appdelegate.tmp $APPDELEGATE_PATH
}

modifyAppdelegate

echo "💥 Appdelegate modified 💥"

#Install pods
#pod repo update
pod install
#pod update

echo "💥 Pods installed 💥"

#Önmegsemmisíétés
destroy() {
    rm $0
}

destroy

echo "💥 Suicide 💥"
echo "💥 End of Post script. OTT VAN 💥"

