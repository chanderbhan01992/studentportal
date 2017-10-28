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

if __name__ == '__main__':
    #Run whichever method you want to run
    loadClubsData ( )
