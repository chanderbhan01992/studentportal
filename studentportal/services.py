import subprocess
import os


BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH_TO_REFRESH_RESTART_SCRIPT = os.path.join(BASE_DIR,"resources/scripts/server")
REFRESH_RESTART_SCRIPT = "./refresh_and_restart.sh studentportal123"

def bitbucket_webhooks(request):
    if request.method == "POST" or request.method == "GET":
        print "BitBucket Webhook hit with request :",request
        print "Calling scripts to reload and restart scripts"
        print BASE_DIR
        print PATH_TO_REFRESH_RESTART_SCRIPT
        os.chdir(PATH_TO_REFRESH_RESTART_SCRIPT)
        subprocess.call(REFRESH_RESTART_SCRIPT)
        print "Finished rerunning"
        return "OK"
