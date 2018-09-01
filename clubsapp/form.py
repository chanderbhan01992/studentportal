from django import forms
from django.forms import ModelForm, Textarea
from .models import *

# FORM GENERATED WITH USE OF MODEL FORMS
class ClubForm(forms.ModelForm):

    class Meta:

        model = Club
        fields = [
            'displayName',
            'aboutUs',
            'yearOfStart',
            'clubType',
            'facultyInCharge1',
            'facultyInCharge2',
        ]
        # ADD WIDGETS HERE
        widgets = {
            'displayName': Textarea(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control'}),
            'aboutUs': Textarea(attrs={'cols': 'auto', 'rows': 'auto'}),
            'yearOfStart': Textarea(attrs={'cols': 'auto', 'rows': 1}),
            'clubType': Textarea(attrs={'cols': 'auto', 'rows': 'auto'}),
            'facultyInCharge1': Textarea(attrs={'cols': 'auto', 'rows': 1}),
            'facultyInCharge2': Textarea(attrs={'cols': 'auto', 'rows': 1}),
        }

    # def __init__(self, *args, **kwargs):
    #     super(ClubForm, self).__init__(*args, **kwargs)
    #     for visible in self.visible_fields():
    #         visible.field.widget.attrs['class'] = 'form-control'


class ContactDetailsForm(forms.ModelForm):

    class Meta:
        model = ContactDetails
        fields = [
            'email',
            'website',
            'telephone1',
            'telephone2',
        ]
        # ADD WIDGETS HERE

# class FacultyForm(forms.ModelForm):
#
#     class Meta:
#         model = Faculty
#         fields = [
#             'name',
#             'link',
#         ]


class PhotosForm(forms.ModelForm):

    class Meta:
        model = Photos
        fields = [
            'photograph',
            'details',
            'dateOfCapture'
        ]


# TODO: Add other Model Forms here


class clubAdmin(forms.Form):

    #Fetching Clubs list
    club = Club.objects.all()
    ch = []
    for c in club:
        choice = (c.id, c.shortName)
        ch.append(choice)

    '''Select list of clubs'''
    clubname = forms.ChoiceField(choices=ch,
                                 required=True)
    #username = forms.IntegerField(required=True)
    password = forms.CharField(initial='clubhead',
                               max_length=32,
                               widget=forms.PasswordInput)

