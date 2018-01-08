import sys,os
import csv
from datetime import datetime
from django.http import HttpResponseRedirect
import requests
import urllib2
import json
import datetime
import dateutil.parser
from django.core.files import File
from django.core.files.temp import NamedTemporaryFile

''' SETUP DJANGO ENVIRONMENT '''
BASE_DIR = os.path.dirname(
                        os.path.dirname(
                            os.path.abspath(__file__)
                        )
                    )

DJANGO_PROJECT_HOME = os.path.dirname(
                os.path.dirname(
                    BASE_DIR
                )
            )
sys.path.append(DJANGO_PROJECT_HOME)
os.environ['DJANGO_SETTINGS_MODULE'] = 'studentportal.settings.development'

print "Importing Models"
from clubsapp.models import *
print "Importing Done :)"



''' FILES AND DIRECTORIES '''
DIRECTORY_CSVFILES = "\CSVFiles"
FILE_CSV_CLUBS = BASE_DIR + DIRECTORY_CSVFILES + "\Club.csv"
FILE_CSV_CONTACT_DETAILS = BASE_DIR + DIRECTORY_CSVFILES + "\ContactDetails.csv"


''' Parse Date ANd Time'''
def to_time(time):
    m = dateutil.parser.parse(time)
    return m.strftime('%H:%M:%S')
def to_date(time):
    m = dateutil.parser.parse(time)
    return m.strftime('%Y-%m-%d')
# for generate random string
def randomword(length):
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(length))


def loadClubsData():
    dataReader = csv.reader ( open ( FILE_CSV_CLUBS ) , delimiter=',' , quotechar='"' )
    for row in dataReader:
        if row[0] == 'id':  # Ignore the header row, import everything
            print 'Ignored the header'
        else:
            club = Club()
            club.id = row[0]
            club.shortName = row[1]
            club.longName = row[2]
            club.displayName = row[3]
            club.aboutUs = row[4]
            club.yearOfStart = row[5]

            personInfoObject = Personinformation.objects.get(clg_id=15616)
            print personInfoObject
            club.president = personInfoObject

            club.clubType = row[7]
            club.facultyInCharge1 = row[8]
            club.facultyInCharge2 = row[9]
            contact_detail = ContactDetails.objects.get(id=row[10])
            print contact_detail
            club.contact = contact_detail
            club.save()


def loadContactDetailsData():
    dataReader = csv.reader ( open ( FILE_CSV_CONTACT_DETAILS ) , delimiter=',' , quotechar='"' )
    for row in dataReader:
        if row[ 0 ] == 'id':  # Ignore the header row, import everything
            print 'Ignored the header'
        else:
            contact = ContactDetails()
            contact.id = row[0]
            contact.email = row[1]
            contact.website = row[2]
            contact.telephone1 = row[3]
            contact.telephone2 = row[4]
            contact.save()

''' Downloads All the events from facebook'''
def facebook_events :

    # fb token
    token = 'EAACEdEose0cBAHRnPj08sWSAVb43mmHprzK6iCkyZAKZBbAPX8MmEvNdr53KTVYvYOZAPKsMl15S8NAfiuCQvZBGqr9UmwgbE4PIG7DcrO7mrGEr6ySNunRpT3RYWFveqwf3KpJRfKJQCpHaRiuZCVUbOPpUEV83o1M8Uf1G4qRFZAQWILpPna0eU9g8qzABQeu7ZCtVTGN5DU4kTTYF6av'

    # making HTTP request to graph API
    def fb_catch(url):
        # making req to fb
        jsondata = urllib2.urlopen(url)
        # convert to python data
        pydata = json.load(jsondata)
        print
        pydata
        return pydata


    # fbid = '125409010890443' #mag
    # fbid = '1413870692209917' #ecell
    # fbid = '' #ieee
    # fbid = '122188297874827' #prayaas
    # fbid = '558880000805766' #astro
    # fbid = '1641158256150398' #ivlabs
    # fbid = '174942216314910' #tesla
    # fbid = '' #grooves
    # fbid = '190530800978437' #iridecence
    # fbid = '302597396486782'#team v
    # fbid = '1492529371023579' #iiche
    # fbid = '109896629705563' #hallabol


    # url for getting events
    eventurl = 'https://graph.facebook.com/v2.11/' + fbid + '/events?limit=6&access_token=' + token

    eventdata = fb_catch(eventurl)
    eventdata = eventdata['data']

    for data in eventdata:
        event = Event()
        event.heading = data['name']
        print
        event.heading + " loading..."
        event.description = data['description']
        event.place = data['place']['name']

        event.date = to_date(data['start_time'])
        event.time = to_time(data['start_time'])
        event.save()

        cer = ClubEventRelationship()
        cerclub = Club.objects.get(pk=11)
        cer.club = cerclub
        print
        cerclub

        cerevent = event
        print
        cerevent
        cer.event = cerevent
        cer.save()
        print
        "DONE"

    print
    "complete"


'''Load Gallery Images'''
def facebook_gallery:

    club = Club.objects.get(pk=12)
    # location = 'images/12/' #before running the file uncomment the location
    # os.chdir(location)
    # os.getcwd()
    for file in os.listdir(location):
        gall_img = Photos()

        # spliting the extension of thr file
        extension = os.path.splitext(file)[1]
        # assign the name to file
        imgname = 'gal_' + club.shortName + randomword(6) + str(extension)
        print
        file
        path = location + file
        # open the file
        handle = open(path, 'rb')
        # change to main directory
        # os.chdir('C:\stupo\VNITClubs')
        # saving the image
        gall_img.photograph.save(imgname, File(handle))
        print
        "Saved"
        gall_img.details = 'gallery image for a club ' + str(club.id)
        print
        gall_img.details
        gall_img.save()

        club_photo = ClubPhotoRelationship()
        club_photo.photo = gall_img
        club_photo.club = club
        print
        club_photo
        club_photo.save()
        print
        "Done" + imgname
    print
    "Complete Club"


def facebook_post:
    # fb token
    token = 'EAACEdEose0cBACl83wqGf1Rn9U3dh2ZBR5FIfMS5pMFTP2mhKRcyGIexbkGF7f3PE1IzzGoSzfZBUyMVZCqZCi2jfaGrL81ZBdn10qL0pbqy2sRdGZCztNMZCe1997MzB5U4S6TGVeoQiCuMikgmbnoy5hsQmmyEgnmRTZC3EL52oF2H7IaDFp9UrY0xbtwbnXM82CF1aZBXfdAZDZD'

    # making HTTP request to graph API
    def fb_catch(url):

        # making req to fb
        jsondata = urllib2.urlopen(url)
        # convert to python data
        pydata = json.load(jsondata)
        print
        pydata
        return pydata



    # fbid = '125409010890443' #mag
    # fbid = '1413870692209917' #ecell
    # fbid = '' #ieee
    # fbid = '122188297874827' #prayaas
    # fbid = '558880000805766' #astro
    # fbid = '1641158256150398' #ivlabs
    # fbid = '174942216314910' #tesla
    # fbid = '' #grooves
    # fbid = '190530800978437' #iridecence
    # fbid = '302597396486782'#team v
    # fbid = '1492529371023579' #iiche
    # fbid = '109896629705563' #hallabol



    # url for getting events
    posturl = 'https://graph.facebook.com/v2.11/' + fbid + '/posts?fields=full_picture,message,created_time&limit=8&access_token=' + token

    postdata = fb_catch(posturl)
    postdata = postdata['data']

    for data in postdata:
        activity = Activity()
        activity.title = fbid
        activity.date = to_date(data['created_time'])
        try:
            activity.description = data['message']
        except KeyError:
            continue

        try:
            activity.save()
        except:
            continue

        car = ClubActivityRelationship()
        carclub = Club.objects.get(pk=12)
        car.club = carclub
        print
        carclub
        caractivity = activity
        print
        caractivity
        car.activity = caractivity
        car.save()

        print
        "downloading.. photo"
        photo = Photos()

        try:
            url = data['full_picture']  # url
            # assigning name to image
            img_name = carclub.shortName + "_act" + "_" + randomword(4) + ".jpg"
            # creating a temporary file
            img_temp = NamedTemporaryFile()
            # making request, reading and writing into empty temp file
            img_temp.write(urllib2.urlopen(url).read())
            img_temp.flush()
            # save the photo
            photo.photograph.save(img_name, File(img_temp))
            print
            "Downloaded and saved ;>"
        except KeyError:
            continue

        try:
            photo.details = data['message']
        except KeyError:
            continue
        photo.dateOfCapture = to_date(data['created_time'])
        photo.save()

        apr = ActivityPhotoRelationship()
        apractivity = Activity.objects.get(pk=activity.id)
        apr.activity = apractivity
        print
        apractivity
        apr.photo = Photos.objects.get(pk=photo.id)
        apr.save()

        print("DONE")
    print("Complete")


if __name__ == '__main__':
    #Run whichever method you want to run
    loadClubsData ( )
