# Microblog
- Github: [https://github.com/chanlis/microblog](https://github.com/chanlis/microblog)
- Site: [http://microblog.catperson.fun/](http://microblog.catperson.fun/)

### Expected Behavior
- FOLLOWS: All logged in users can follow/ unfollow as appropriate. Following users allow the current user to view the messages in the follows page.
- LIKES: All logged in users have the ability to like a message. They are allowed to spam messages with likes to their heart's content, but can't unlike. Everyone can view the likes. The app implements the likes ability as described.

### Deploy Script
There are four deploy script files:
- deploy-release.sh
- deploy-microblog.sh *
- deploy-microblog.sh
- deploy-src.sh *

The scripts with the * are not included in my repo. They are located in my remote server since they run in my remote server. deploy-release is used to bundle the release tar.gz and run on my local machine. deploy-microblog * is run on the remote server to untar the microblog.tar.gz file into /microblog. deploy-microblog (the second file) runs locally to tar the microblog files and scp it to remote server. Lasty, microblog-src untars the files into src/microblog and deploys the server.
