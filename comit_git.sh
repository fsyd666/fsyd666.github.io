checkout source

echo "..................pull" 

git pull

git add .
git commit -m "commit to server"
echo "..................push"
git push origin source

read -p "Press any key to exit..." gitout 