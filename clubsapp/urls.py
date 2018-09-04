from django.conf.urls import url

urlpatterns = [
    url(r'^$' , 'clubsapp.views.clubs'),
    url(r'^clubadmin$', 'clubsapp.views.adminLogin',name="clubLogin"),
    url(r'^editdata$', 'clubsapp.views.editForm', name="editForm"),
    url(r'^clublogout$', 'clubsapp.views.clubLogout', name="clubLogout"),
    url(r'^updateclub$', 'clubsapp.views.clubUpdate',name="updateClub"),
    url(r'^([+-]?[1-9]\d*|0)/$', 'clubsapp.views.clubHome',name="clubName"),
]
