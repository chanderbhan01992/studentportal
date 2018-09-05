from django.http import HttpResponseRedirect
from django.shortcuts import render , render_to_response
from django.core.context_processors import csrf
from django.contrib.auth import authenticate
from django.contrib.auth import login as club_login
from django.contrib.auth import logout as club_logout

from django.contrib.auth.hashers import *
from django.contrib.auth.models import check_password
from django.template import RequestContext
from portalapp.models import *
import requests
import json
import datetime, dateutil.parser

from portalapp.views import *
from clubsapp.models import *
from .form import *


def clubs( request ):

    clubs = Club.objects.all()
    args = {'page_name': ""}
    args.update({'clubs':clubs})
    args.update ( csrf ( request ) )
    args.update ( headerdb ( request ) )

    return render_to_response ( 'VnitClubsHome.html' , args )



def clubHome(request,clubName):
     # Take pagename, find in db ,extract data and use it here.

    #Use clubName to get exact CLubName
    club_data = Club.objects.get(id=clubName)

    args = {'page_name': "",
            'club_data':club_data}
    args.update ( csrf ( request ) )
    args.update ( headerdb ( request ) )

    '''
    args.update({'data': data['data']})
    '''
    activity_club = ClubActivityRelationship.objects.filter(club=club_data)[:4]
    args.update({'activity_data': activity_club})

    event_club =  ClubEventRelationship.objects.filter(club = club_data)[:4]
    args.update({'event_data': event_club})

    club_gall = ClubPhotoRelationship.objects.filter(club = club_data)[:8]
    args.update({'gall_data': club_gall})

    return render_to_response ( 'clubHome.html', args )

def adminLogin(request):

    #if request.session.get('admin',False):

    clubAdminForm = clubAdmin(request.POST)
    #clubs = Club.objects.all()
    args = {'page_name': "", "fname":""}
    #args.update({'clubs': clubs})
    args.update({'form': clubAdminForm})
    args.update(csrf(request))
    args.update(headerdb(request))
    return render_to_response('clubAdmin.html', args)


@cache_control(no_cache=True,must_revalidate=True,no_store=True)
def clubLogout(request):
    request.session['admin'] = False

    return HttpResponseRedirect('/clubs/clubadmin')

@csrf_protect
def editForm(request):
    form = clubAdmin(request.POST)
    if request.method == "POST":

        if form.is_valid():

            #cleaning form data
            obj = form.cleaned_data
            clubname = obj['clubname']
            #username = obj['username']
            password = obj['password']

            club = Club.objects.get(id=clubname)

            try:
                club_admin = ClubAdmin.objects.get(club = club)
            except:
                return render(request, "clubAdmin.html", {"message": "Your Club Admin isn't registered with us.", "form": form,'page_name': "","fname":""})
            #validate password
            if password == club_admin.password:


                contact_info = ContactDetails.objects.get(id=club.id)
                submit_display = "block"
                login_display = "none"
                logout_display = "block"
                title = "Welcome " + str(club.clubHead)
                subtitle = "Club Name: " + str(club.displayName)

                club_form = ClubForm(
                    initial={
                        'displayName': club.displayName,
                        'aboutUs': club.aboutUs,
                        'yearOfStart': club.yearOfStart,
                        'clubType': club.clubType,
                        'facultyInCharge1': club.facultyInCharge1,
                        'facultyInCharge2': club.facultyInCharge2,
                    }
                )

                contact_details_form = ContactDetailsForm(
                    initial={
                        'email': contact_info.email,
                        'website': contact_info.website,
                        'telephone1': contact_info.telephone1,
                        'telephone2': contact_info.telephone2,
                    }
                )


                form_display = "block"
                context = {
                    "fname": "",
                    "page_name": "Edit Club Details",
                    "title": title,
                    "subtitle": subtitle,
                    "clubId": club.id,
                    "club_form":club_form,
                    "contact_details_form": contact_details_form,
                    "form_display": form_display,
                    "id_display": 'block',
                    "submit_display": submit_display,
                    "login_display": login_display,
                    "logout_display": logout_display,
                    "update_display": 'none',
                }
                request.session["admin"] = club.id
                context.update(csrf(request))
                context.update(headerdb(request))

                return render(request, "editform.html", context)
            else:
                return render(request, "clubAdmin.html", {"message": "Invalid Credentials", "form": form,'page_name': "","fname":""})
        return render(request, "clubAdmin.html", {"message": "Kindly Fill the form Correctly", "form": form,'page_name': "","fname":""})

    elif request.session.get("admin, False"):
        clubname = request.session["admin"]
        club = Club.objects.get(id=clubname)
        contact_info = ContactDetails.objects.get(id=club.id)
        submit_display = "block"
        login_display = "none"
        logout_display = "block"
        title = "Welcome " + str(club.clubHead)
        subtitle = "Club Name: " + str(club.displayName)

        club_form = ClubForm(
            initial={
                'displayName': club.displayName,
                'aboutUs': club.aboutUs,
                'yearOfStart': club.yearOfStart,
                'clubType': club.clubType,
                'facultyInCharge1': club.facultyInCharge1,
                'facultyInCharge2': club.facultyInCharge2,
            }
        )

        contact_details_form = ContactDetailsForm(
            initial={
                'email': contact_info.email,
                'website': contact_info.website,
                'telephone1': contact_info.telephone1,
                'telephone2': contact_info.telephone2,
            }
        )

        form_display = "block"
        context = {
            "fname": "",
            "page_name": "Edit Club Details",
            "title": title,
            "subtitle": subtitle,
            "clubId": club.id,
            "club_form": club_form,
            "contact_details_form": contact_details_form,
            "form_display": form_display,
            "id_display": 'block',
            "submit_display": submit_display,
            "login_display": login_display,
            "logout_display": logout_display,
            "update_display": 'none',
        }
        context.update(csrf(request))
        context.update(headerdb(request))
        return render(request, "editform.html", context)

    else:
        return render(request, "clubAdmin.html",{"message":"Invalid Method", "form":form,'page_name': "","fname":""})

def clubUpdate(request):

    if request.method == 'POST' or request.session.get("admin", False):

        '''Getting Club ID Only from sessions'''
        clubname = request.session["admin"]

        '''Updating Club Details'''
        club = Club.objects.get(id=clubname)
        club_name = request.POST.get('displayName', False)
        about_us = request.POST.get('aboutUs', False)
        yearOfStart = request.POST.get('yearOfStart', False)
        clubType = request.POST.get('clubType', False)
        facultyInCharge1 = request.POST.get('facultyInCharge1', False)
        facultyInCharge2 = request.POST.get('facultyInCharge2', False)


        club.displayName = club_name
        club.aboutUs = about_us
        club.yearOfStart = yearOfStart
        club.clubType = clubType
        club.facultyInCharge1 = facultyInCharge1
        club.facultyInCharge2 = facultyInCharge2
        club.save()

        '''Updating Contact Details'''
        contact_info = ContactDetails.objects.get(id=club.id)
        email = request.POST.get('email', False)
        website = request.POST.get('website', False)
        telephone1 = request.POST.get('telephone1', False)
        telephone2 = request.POST.get('telephone2', False)

        contact_info.email = email
        contact_info.website = website
        contact_info.telephone1 = telephone1
        contact_info.telephone2 = telephone2
        contact_info.save()



        submit_display = "block"
        login_display = "none"
        logout_display = "block"
        title = "Welcome " + str(club.clubHead)
        subtitle = "Club Name: " + str(club.displayName)

        club_form = ClubForm(
            initial={
                'displayName': club.displayName,
                'aboutUs': club.aboutUs,
                'yearOfStart': club.yearOfStart,
                'clubType': club.clubType,
                'facultyInCharge1': club.facultyInCharge1,
                'facultyInCharge2': club.facultyInCharge2,
            }
        )

        contact_details_form = ContactDetailsForm(
            initial={
                'email': contact_info.email,
                'website': contact_info.website,
                'telephone1': contact_info.telephone1,
                'telephone2': contact_info.telephone2,
            }
        )

        form_display = "block"
        context = {
            "fname": "",
            "page_name": "Edit Club Details",
            "title": title,
            "message": "Club Data updated successfully!",
            "subtitle": subtitle,
            "clubId": club.id,
            "club_form": club_form,
            "contact_details_form": contact_details_form,
            # "faculty_form": faculty_form,
            "form_display": form_display,
            "id_display": 'block',
            "submit_display": submit_display,
            "login_display": login_display,
            "logout_display": logout_display,
            "update_display": 'none',
        }
        context.update(csrf(request))
        context.update(headerdb(request))
        return render(request, "editform.html",context)
    form = clubAdmin(request.POST)
    return render(request, "clubAdmin.html", {"message": "Kindly Login First", "form": form,'page_name': "","fname":""})


'''  new forgot password Atharva '''
@cache_control(no_cache=True, must_revalidate=True, no_store=True)
def clubresetpass(request, fkey):
   if request.method == 'POST':
       # clg_id = base64.urlsafe_b64decode(clg_id.encode("ascii"))
       # print
       # clg_id
       pass1 = request.POST.get('pass1', '')
       pass2 = request.POST.get('pass2', '')
       if len(pass1) >= 8:
           if pass1 == pass2:
               # obj1 = Personinformation.objects.filter(clg_id=clg_id).first()
               try:
                   fpk_obj = ClubForgotPassKeys.objects.get(key=fkey, is_valid=True)
                   obj1 = fpk_obj.club
                   obj = ClubAdmin.objects.filter(club=obj1).first()
                   obj.password = make_password(pass1)
                   fpk_obj.is_valid = False
                   fpk_obj.save()
                   # print
                   # obj.password
                   obj.save()
                   return HttpResponseRedirect('/home/clubs/')
               except ClubForgotPassKeys.DoesNotExist:
                   pass
                   '''err_msg = "Link is either expired or invalid"
                   args = {'err_msg': err_msg}
                   args.update(headerdb(request))
                   args.update(csrf(request))
                   return render_to_response('resetpass.html', args)'''
           else:
               err_msg = "Passwords don't match"
               args = {'err_msg': err_msg}
               args.update(headerdb(request))
               args.update(csrf(request))
               return render_to_response('resetpass.html', args)
       else:
           err_msg = "Minimum 8 characters required"
           args = {'err_msg': err_msg}
           args.update(headerdb(request))
           args.update(csrf(request))
           args.update({'page_name':'Reset Password'})
           return render_to_response('resetpass.html', args)

   # else : return HttpResponseRedirect('/forgetpass/%d' clg_id)
   try:
       fpk_obj = ClubForgotPassKeys.objects.get(key=fkey, is_valid=True)
       args = {}
       args.update(headerdb(request))
       args.update(csrf(request))
       args.update({'page_name':'Reset Password'})
       return render_to_response('resetpass.html', args)
   except ClubForgotPassKeys.DoesNotExist:
       fname = ""
       err_msg = ["Invalid or Expired link"]
       open_modal1 = 6
       args = {'fname': fname, 'open_modal1': open_modal1, 'err_msg_fp': err_msg,}
       args.update(headerdb(request))
       return render(request, 'homepage.html', args)


def clubforgotpass(request):
   if request.method == "POST":
       #clg_id = request.POST.get('clg_id')
       email = request.POST.get('email')
       err_msg = server_validations.isvalid_clubforgotpass(email)
       print err_msg
       flag = 0
       for i in err_msg:
           if i != "":
               flag = 1
               # fname = ""

       if flag == 0:
           # if Personinformation.objects.filter(clg_id=clg_id).first() is not None:
           if ContactDetails.objects.filter(email=email).first() is not None:
               # link = request.META['HTTP_HOST']+"/resetpass/%s" %clg_id
               # email_msg="Click on the following link to reset your password:
               # \n"+request.META['HTTP_HOST']+"/resetpass/%s" % base64.urlsafe_b64encode(clg_id)
               # emailobj = Personinformation.objects.filter(clg_id=clg_id).first()
               # New Forgot Password Implementation by Atharva
               email_obj = ContactDetails.objects.filter(email=email).first()
               print email_obj
               club = Club.objects.get(contact=email_obj)
               print club
               email = email_obj
               try:
                   fpk_obj = ClubForgotPassKeys.objects.get(club=club, is_valid=True)
                   uid = fpk_obj.key
               except ClubForgotPassKeys.DoesNotExist:
                   uid = "club" + get_random_string(length=10)
                   forgotpasskey_obj = ClubForgotPassKeys()
                   forgotpasskey_obj.club = club
                   forgotpasskey_obj.key = uid
                   forgotpasskey_obj.save()

               # person_obj=Personinformation.objects.filter(clg_id=clg_id).first()
               # link = request.META['HTTP_HOST']+"/resetpass/%s" % base64.urlsafe_b64encode(clg_id)
               link = request.META['HTTP_HOST'] + "/clubs/resetpass/" + uid
               email_msg = loader.render_to_string('password_reset_email.html',
                                                   {'name': club.shortName, 'link': link})
               # password_reset_email.html
               try:
                   send_mail('Student portal password reset for clubs', "This is it", FROM_EMAIL,[email], html_message=email_msg)
                   return HttpResponseRedirect('/home/?forgotpass_emailsent=' + str(1))
               except:
                    print "There is some error semding mail"
               return HttpResponseRedirect('/home/?forgotpass_emailsent='+str(2))
           # else:
           #     fname = ""
           #     err_msg = ["Wrong combination of email and clgid"]
           #     open_modal1 = 6
           #     args = {'fname': fname, 'open_modal1': open_modal1, 'err_msg_fp': err_msg, 'clg_id': clg_id}
           #     args.update(headerdb(request))
           #     return render(request, 'homepage.html', args)
           else:
               fname = ""
               err_msg = ["Club not registered"]
               open_modal1 = 6
               args = {'fname': fname, 'open_modal1': open_modal1, 'err_msg_fp': err_msg, 'clg_id': email}
               args.update(headerdb(request))
               return render(request, 'homepage.html', args)
       else:
           fname = ""
           err_msg = "Something went wrong"
           # print "frontend error"
           open_modal1 = 6  # forgot pass modal
           args = {'fname': fname, 'open_modal1': open_modal1, 'err_msg_fp': err_msg, 'clg_id': email}
           args.update(headerdb(request))
           return render(request, 'homepage.html', args)

   fname = ""
   print "frontend error"
   open_modal1 = 6  # forgot pass modal
   args = {'fname': fname, 'open_modal1': open_modal1}
   args.update(headerdb(request))
   return render(request, 'homepage.html', args)
