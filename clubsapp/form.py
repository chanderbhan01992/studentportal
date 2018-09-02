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
            'displayName': forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control '}),
            'aboutUs': forms.TextInput(attrs={'cols': 'auto', 'rows': 'auto', 'class': 'form-control'}),
            'yearOfStart': forms.TextInput(attrs={'cols': '2', 'rows': 1, 'class': 'form-control '}),
            'clubType': forms.TextInput(attrs={'cols': '2', 'rows': '1', 'class': 'form-control '}),
            'facultyInCharge1': forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control '}),
            'facultyInCharge2': forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control'}),
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
        widgets = {
            'email': forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control '}),
            'website': forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control'}),
            'telephone1' : forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control'}),
            'telephone2' : forms.TextInput(attrs={'cols': 'auto', 'rows': 1, 'class': 'form-control'}),
        }

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

    clubname.widget.attrs.update({'class': 'form-control'})
    password.widget.attrs.update({'class': 'form-control'})

