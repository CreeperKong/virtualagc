// -*- C++ -*- generated by wxGlade 0.6.3 on Thu Mar 26 15:34:04 2009

#include "MessageBox.h"

// begin wxGlade: ::extracode
// end wxGlade



MyFrame::MyFrame(wxWindow* parent, int id, const wxString& title, const wxPoint& pos, const wxSize& size, long style):
    wxFrame(parent, id, title, pos, size, wxDEFAULT_FRAME_STYLE)
{
// content of this block not found: did you rename this class?
}


void MyFrame::set_properties()
{
// content of this block not found: did you rename this class?
}


void MyFrame::do_layout()
{
// content of this block not found: did you rename this class?
}



class MessageBoxAppClass: public wxApp {
public:
    bool OnInit();
};

IMPLEMENT_APP(MessageBoxAppClass)

bool MessageBoxAppClass::OnInit()
{
    wxInitAllImageHandlers();
    
    MyFrameClass* MyFrame = new MyFrameClass(NULL, wxID_ANY, wxEmptyString);
    SetTopWindow(MyFrame);
    
    MyFrame->Text->SetValue (argv[1]);
    MyFrame->InvalidateBestSize ();
    MyFrame->Layout ();
    MyFrame->Fit ();
    
    MyFrame->Show();
    return true;
}



MyFrameClass::MyFrameClass(wxWindow* parent, int id, const wxString& title, const wxPoint& pos, const wxSize& size, long style):
    wxFrame(parent, id, title, pos, size, wxDEFAULT_FRAME_STYLE)
{
    // begin wxGlade: MyFrameClass::MyFrameClass
    panel_1 = new wxPanel(this, wxID_ANY);
    Text = new wxTextCtrl(panel_1, wxID_ANY, wxEmptyString, wxDefaultPosition, wxDefaultSize, wxTE_MULTILINE|wxTE_READONLY|wxTE_RICH|wxTE_WORDWRAP);

    set_properties();
    do_layout();
    // end wxGlade
}


void MyFrameClass::set_properties()
{
    // begin wxGlade: MyFrameClass::set_properties
    SetTitle(wxT("Information"));
    Text->SetMinSize(wxSize(360,360));
    Text->SetFont(wxFont(14, wxFONTFAMILY_DEFAULT, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_BOLD, 0, wxT("")));
    panel_1->SetFont(wxFont(14, wxFONTFAMILY_DEFAULT, wxFONTSTYLE_NORMAL, wxFONTWEIGHT_BOLD, 0, wxT("")));
    // end wxGlade
}


void MyFrameClass::do_layout()
{
    // begin wxGlade: MyFrameClass::do_layout
    wxBoxSizer* sizer_1 = new wxBoxSizer(wxVERTICAL);
    wxFlexGridSizer* grid_sizer_1 = new wxFlexGridSizer(3, 3, 0, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(Text, 1, wxEXPAND|wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    grid_sizer_1->Add(20, 20, 0, wxADJUST_MINSIZE, 0);
    panel_1->SetSizer(grid_sizer_1);
    sizer_1->Add(panel_1, 0, 0, 0);
    SetSizer(sizer_1);
    sizer_1->Fit(this);
    Layout();
    // end wxGlade
}











