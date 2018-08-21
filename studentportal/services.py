import subprocess
import os
from django.http import HttpResponse, Http404

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
PATH_TO_REFRESH_RESTART_SCRIPT = os.path.join(BASE_DIR,"resources/scripts/server")
REFRESH_RESTART_SCRIPT = "./refresh_and_restart.sh"
REFRESH_RESTART_KEY = "studentportal123"

def bitbucket_webhooks(request):
    if request.method == "GET" or request.method == "POST":
        print "BitBucket Webhook hit with request :",request
        print "Calling scripts to reload and restart scripts"
        print BASE_DIR
        print PATH_TO_REFRESH_RESTART_SCRIPT
        os.chdir(PATH_TO_REFRESH_RESTART_SCRIPT)
        subprocess.call([REFRESH_RESTART_SCRIPT,REFRESH_RESTART_KEY]) #passing key as a 1 argv
        print "Finished rerunning"
        return HttpResponse(status = 200)
    return HttpResponse(status = 404)
