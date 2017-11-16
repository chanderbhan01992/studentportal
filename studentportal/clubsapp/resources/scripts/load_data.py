import sys,os
import csv

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


from clubsapp.models import *

''' FILES AND DIRECTORIES '''
DIRECTORY_CSVFILES = "\CSVFiles"
FILE_CSV_CLUBS = BASE_DIR + DIRECTORY_CSVFILES + "\Club.csv"
FILE_CSV_CONTACT_DETAILS = BASE_DIR + DIRECTORY_CSVFILES + "\ContactDetails.csv"

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

#Kindly separate the functionalities i below functions into different functions
def loadRestDetails():
    dataReader = csv.reader ( open ( FILE_CSV_CLUBS ) , delimiter=',' , quotechar='"' )
    for row in dataReader:
        if row[ 0 ] == 'id':  # Ignore the header row, import everything
            print 'Ignored the header'
        else:
            clubmember = ClubMember ( )
            clubmember.id = row[ 0 ]
            clubmember.basicDetails = row[ 1 ]
            memberPost = Post.object.get ( id=row[ 2 ] )
            print memberPost
            clubmember.post = memberPost
            clubmember.photograph = row[ 3 ]
            clubmember.dateOfJoin = row[ 4 ]
            clubmember.dateOfLeave = row[ 5 ]
            clubmember.save ( )

            contact = ContactDetails ( )
            contact.id = row[ 0 ]
            contact.email = row[ 1 ]
            contact.website = row[ 2 ]
            contact.telephone1 = row[ 3 ]
            contact.telephone2 = row[ 4 ]
            contact.save ( )

            post = Post ( )
            post.id = row[ 0 ]
            post.shortName = row[ 1 ]
            post.longName = row[ 2 ]
            post.displayName = row[ 3 ]
            post.save ( )

            photos = Photos ( )
            photos.id = row[ 0 ]
            photos.photographs = row[ 1 ]
            photos.details = row[ 2 ]
            photos.dateOfCapture = row[ 3 ]
            photos.save ( )

            event = Event ( )
            event.id = row[ 0 ]
            event.shortName = row[ 1 ]
            event.longName = row[ 2 ]
            event.displayName = row[ 3 ]
            event.place = row[ 4 ]
            event.time = row[ 5 ]
            event.date = row[ 6 ]
            event.save ( )

            activity = Activity ( )
            activity.id = row[ 0 ]
            activity.title = row[ 1 ]
            activity.description = row[ 2 ]
            activity.date = row[ 3 ]
            activity.save ( )

            cer = ClubEventRelationship ( )
            cer.id = row[ 0 ]
            cerclub = Club.object.get ( id=row[ 1 ] )
            print cerclub
            cer.club = cerclub
            cerevent = Event.object.get ( id=row[ 2 ] )
            print cerevent
            cer.event = cerevent
            cer.save ( )

            car = ClubActivityRelationship ( )
            car.id = row[ 0 ]
            carclub = Club.object.get ( id=row[ 1 ] )
            print carclub
            car.club = carclub
            caractivity = Activity.object.get ( id=row[ 2 ] )
            print caractivity
            car.activity = caractivity
            car.save ( )

            cpr = ClubPhotoRelationship ( )
            cpr.id = row[ 0 ]
            cprclub = Club.object.get ( id=row[ 1 ] )
            print cprclub
            cpr.club = cprclub
            cprphoto = Photos.object.get ( id=row[ 2 ] )
            print cprphoto
            cpr.photo = cprphoto
            cpr.save ( )

            epr = EventPhotoRelationship ( )
            epr.id = row[ 0 ]
            eprevent = Event.object.get ( id=row[ 1 ] )
            print eprevent
            epr.event = eprevent
            eprphoto = Photos.object.get ( id=row[ 2 ] )
            print eprphoto
            epr.photo = eprphoto
            epr.save ( )

            apr = ActivityPhotoRelationship ( )
            apr.id = row[ 0 ]
            apractivity = Activity.object.get ( id=row[ 1 ] )
            print apractivity
            apr.activity = apractivity
            aprphoto = Photos.object.get ( id=row[ 2 ] )
            print aprphoto
            apr.photo = aprphoto
            apr.save ( )

if __name__ == '__main__':
    #Run whichever method you want to run
    loadClubsData ( )
