// -*- C++ -*- generated by wxGlade 0.6.3 on Thu Mar 19 15:10:50 2009
/*
  Copyright 2009,2021 Ronald S. Burkey <info@sandroid.org>
  
  This file is part of yaAGC. 

  yaAGC is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  yaAGC is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with yaAGC; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

  Filename:	sterm.cpp
  Purpose:	A sort of dumb-terminal program for running yaAGC or yaAGS
  		in --debug mode, since I can't rely on xterm being available
		all the time, and since xterm isn't extremely pleasant
		anyway.
  Reference:	http://www.ibiblio.org/apollo/index.html
  Mode:		2009-03-19 RSB.	Began.
                2021-03-22 RSB  Changed constants (wxFONTFAMILY_xxx,
                                wxFONTSTYLE_xxx, wxFONTWEIGHT_xxx) used
                                in wxFont invocations, to avoid "deprecated"
                                warnings with wxWidgets 3.1.x.
*/

#include "sterm.h"

// begin wxGlade: ::extracode
// end wxGlade



StermFrameClass::StermFrameClass(wxWindow* parent, int id, const wxString& title, const wxPoint& pos, const wxSize& size, long style):
    wxFrame(parent, id, title, pos, size, wxDEFAULT_FRAME_STYLE)
{
    Points = 10;
    
    // begin wxGlade: StermFrameClass::StermFrameClass
    BiggerButton = new wxButton(this, ID_BIGGER, _("Bigger"));
    SmallerButton = new wxButton(this, ID_SMALLER, _("Smaller"));
    TextCtrl = new wxTextCtrl(this, ID_TEXT, wxEmptyString, wxDefaultPosition, wxDefaultSize, wxTE_PROCESS_ENTER|wxTE_MULTILINE|wxHSCROLL|wxTE_RICH);

    set_properties();
    do_layout();
    // end wxGlade
}


BEGIN_EVENT_TABLE(StermFrameClass, wxFrame)
    // begin wxGlade: StermFrameClass::event_table
    EVT_BUTTON(ID_BIGGER, StermFrameClass::OnBiggerPress)
    EVT_BUTTON(ID_SMALLER, StermFrameClass::OnSmallerPress)
    EVT_TEXT_MAXLEN(ID_TEXT, StermFrameClass::OnTextMaxlen)
    EVT_TEXT_ENTER(ID_TEXT, StermFrameClass::OnTextEnter)
    // end wxGlade
END_EVENT_TABLE();


void StermFrameClass::OnBiggerPress(wxCommandEvent &event)
{
    FontSize (++Points);
    //Fit ();
}


void StermFrameClass::OnSmallerPress(wxCommandEvent &event)
{
    if (Points > 6)
      {
        FontSize (--Points);
	//Fit ();
      }
}

// Set font-size in the text control.
void 
StermFrameClass::FontSize (int Points)
{
  TextCtrl->SetFont(wxFont(Points, wxFONTFAMILY_MODERN, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL, 0, wxT("")));
}

void StermFrameClass::OnTextMaxlen(wxCommandEvent &event)
{
    event.Skip();
    wxLogDebug(wxT("Event handler (StermFrameClass::OnTextMaxlen) not implemented yet")); //notify the user that he hasn't implemented the event handler yet
}


void StermFrameClass::OnTextEnter(wxCommandEvent &event)
{
    event.Skip();
    wxLogDebug(wxT("Event handler (StermFrameClass::OnTextEnter) not implemented yet")); //notify the user that he hasn't implemented the event handler yet
}


// wxGlade: add StermFrameClass event handlers


void StermFrameClass::set_properties()
{
    // begin wxGlade: StermFrameClass::set_properties
    SetTitle(_("Debugging window"));
    SetSize(wxSize(800, 400));
    BiggerButton->SetToolTip(_("Click this to increase the text size."));
    SmallerButton->SetToolTip(_("Click this to make the text smaller."));
    TextCtrl->SetFont(wxFont(10, wxFONTFAMILY_MODERN, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_NORMAL, 0, wxT("")));
    // end wxGlade
}


void StermFrameClass::do_layout()
{
    // begin wxGlade: StermFrameClass::do_layout
    wxBoxSizer* sizer_1 = new wxBoxSizer(wxVERTICAL);
    wxBoxSizer* sizer_3 = new wxBoxSizer(wxHORIZONTAL);
    wxBoxSizer* sizer_2 = new wxBoxSizer(wxHORIZONTAL);
    sizer_1->Add(20, 10, 0, wxADJUST_MINSIZE, 0);
    sizer_2->Add(20, 20, 1, wxADJUST_MINSIZE, 0);
    sizer_2->Add(BiggerButton, 0, wxADJUST_MINSIZE, 0);
    sizer_2->Add(50, 20, 0, wxADJUST_MINSIZE, 0);
    sizer_2->Add(SmallerButton, 0, wxADJUST_MINSIZE, 0);
    sizer_2->Add(20, 20, 1, wxADJUST_MINSIZE, 0);
    sizer_1->Add(sizer_2, 0, wxEXPAND, 0);
    sizer_1->Add(20, 10, 0, wxADJUST_MINSIZE, 0);
    sizer_3->Add(10, 20, 0, wxADJUST_MINSIZE, 0);
    sizer_3->Add(TextCtrl, 1, wxEXPAND|wxADJUST_MINSIZE, 0);
    sizer_3->Add(10, 20, 0, wxADJUST_MINSIZE, 0);
    sizer_1->Add(sizer_3, 1, wxEXPAND, 0);
    sizer_1->Add(20, 10, 0, wxADJUST_MINSIZE, 0);
    SetSizer(sizer_1);
    Layout();
    // end wxGlade
}



class StermAppClass: public wxApp {
public:
    bool OnInit();
};

IMPLEMENT_APP(StermAppClass)

bool StermAppClass::OnInit()
{
    wxInitAllImageHandlers();
    StermFrameClass* TopFrame = new StermFrameClass(NULL, wxID_ANY, wxEmptyString);
    SetTopWindow(TopFrame);
    
    // We assume that all the stuff on the command-line should be concatenated to form
    // a single command which is supposed to be executed with redirection of stdin,
    // stdout, and stderr.
    wxString Command;
    int i;
    for (i = 1; i < argc; i++)
      {
        if (i > 1)
	  Command += wxT (" ");
	Command += argv[i];
      }
    
    TopFrame->Show();
    return true;
}








