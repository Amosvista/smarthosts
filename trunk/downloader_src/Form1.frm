VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "SmartHosts GUI"
   ClientHeight    =   1080
   ClientLeft      =   4932
   ClientTop       =   2916
   ClientWidth     =   3360
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   1080
   ScaleWidth      =   3360
   Begin VB.Frame Frame2 
      Caption         =   "����"
      Height          =   4212
      Left            =   3480
      TabIndex        =   6
      Top             =   120
      Width           =   2052
      Begin VB.ComboBox Combo1 
         Enabled         =   0   'False
         Height          =   276
         Left            =   240
         TabIndex        =   14
         Text            =   "Combo1"
         Top             =   3000
         Width           =   1572
      End
      Begin VB.CommandButton Command10 
         Caption         =   "����(&B)..."
         Enabled         =   0   'False
         Height          =   372
         Left            =   240
         TabIndex        =   11
         Top             =   720
         Width           =   1572
      End
      Begin VB.CommandButton Command8 
         Caption         =   "һ������(&R)"
         Enabled         =   0   'False
         Height          =   372
         Left            =   240
         TabIndex        =   10
         Top             =   2160
         Width           =   1572
      End
      Begin VB.CommandButton Command7 
         Caption         =   "����/������&A)"
         Height          =   372
         Left            =   240
         TabIndex        =   9
         Top             =   3600
         Width           =   1572
      End
      Begin VB.CommandButton Command6 
         Caption         =   "ж��(&U)"
         Height          =   372
         Left            =   240
         TabIndex        =   8
         Top             =   240
         Width           =   1572
      End
      Begin VB.CommandButton Command5 
         Caption         =   "�ֶ��༭(&E)"
         Height          =   372
         Left            =   240
         TabIndex        =   7
         Top             =   1680
         Width           =   1572
      End
      Begin VB.Label Label1 
         Caption         =   "��������Դ"
         Enabled         =   0   'False
         Height          =   252
         Left            =   240
         TabIndex        =   13
         Top             =   2760
         Width           =   972
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "�Զ������"
      Height          =   3252
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   3252
      Begin VB.CommandButton Command11 
         Caption         =   "ȫ��ѡ"
         Height          =   300
         Left            =   1680
         TabIndex        =   12
         Top             =   2760
         Width           =   1092
      End
      Begin VB.CommandButton Command4 
         Caption         =   "ȫѡ"
         Height          =   300
         Left            =   240
         TabIndex        =   5
         Top             =   2760
         Width           =   1092
      End
      Begin VB.ListBox List1 
         Height          =   2292
         ItemData        =   "Form1.frx":4CAC2
         Left            =   240
         List            =   "Form1.frx":4CAC4
         Style           =   1  'Checkbox
         TabIndex        =   4
         Top             =   240
         Width           =   2772
      End
   End
   Begin VB.CommandButton Command3 
      Caption         =   "�˳�(&C)"
      Height          =   372
      Left            =   2280
      TabIndex        =   2
      Top             =   600
      Width           =   972
   End
   Begin VB.CommandButton Command2 
      Caption         =   "�߼�(&O).."
      Height          =   372
      Left            =   120
      TabIndex        =   1
      Top             =   600
      Width           =   972
   End
   Begin VB.CommandButton Command1 
      Caption         =   "����(&U)"
      Height          =   372
      Left            =   1200
      TabIndex        =   0
      Top             =   600
      Width           =   972
   End
   Begin VB.Label Label2 
      Caption         =   "SmartHosts �Զ����³��� Alpha1"
      Height          =   252
      Left            =   600
      TabIndex        =   15
      Top             =   240
      Width           =   3132
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub about_Click()

End Sub

Private Sub Command1_Click()
Command6_Click
On Error GoTo error
hosts = Environ("windir") & "\system32\drivers\etc\hosts"

FileCopy hosts, "C:\Users\BLUBIRD\Desktop\hosts.bak.txt"
AppendData ("#SmartHosts ��ʼ")
  Dim i As Long, j As Long
  j = 0
  For i = 0 To List1.ListCount - 1
    If List1.Selected(i) = False Then j = j + 1 '�ж��Ƿ� ȫ����ѡ
  Next
  If j = List1.ListCount Then 'ȫ����ѡʱĬ��д��ȫ��
    For i = 0 To List1.ListCount - 1
      AppendData ReadTxt(i)
    Next
  Else 'ֻѡ����ʱ
    For i = 0 To List1.ListCount - 1
      If List1.Selected(i) = True Then AppendData ReadTxt(i)
    Next
  End If
AppendData ("#SmartHosts ����")
  MsgBox ("д��ɹ�")
error:   MsgBox ("ŶӴ�������ˣ��ļ��޷�д�롣")
End Sub

Private Sub Command10_Click()
BackupManager.Show
End Sub

Private Sub Command2_Click()
'Command2.Caption = "���Ե�.."
'Command2.Enabled = False
'R = URLDownloadToFile(0, "https://smarthosts.googlecode.com/svn/trunk/hosts.bat", "temp.bat", 0, 0)
'Shell "temp.bat typical 4", vbNormalFocus
'Shell "hosts.bat typical 4", vbNormalFocus
'Command2.Enabled = True
'Command2.Caption = "�߼�ѡ��.."
'Sleep (3000)
'End
Me.Height = 6024
Me.Width = 5940
End Sub

Private Sub Command3_Click()
CreateObject("scripting.filesystemobject").deletefolder (App.Path & "\hostsp_temp"), True
End
End Sub


Private Sub Command4_Click()
For a = List1.ListCount - 1 To 0 Step -1
List1.Selected(a) = True
Next
End Sub

Private Sub Command5_Click()
Shell ("cmd /c notepad.exe %windir%\system32\drivers\etc\hosts")
'Shell ("notepad.exe %windir%\system32\drivers\etc\hosts")
End Sub

Private Sub Command6_Click()
On Error GoTo error
    Dim a() As Byte, Fn As String, s As String
    Dim i, j
    Fn = Environ("Windir") & "\system32\drivers\etc\hosts"
    If Dir(Fn) = "" Then Exit Sub
    '��ȡ�ı�����
    ReDim a(FileLen(Fn) - 1)
    Open Fn For Binary As #1
        Get #1, , a
    Close #1
    'ɾ��ָ������
    s = StrConv(a, vbUnicode)
    i = InStr(1, s, "#SmartHosts ��ʼ", vbTextCompare)
    j = InStr(i, s, "#SmartHosts ����", vbTextCompare)
    j = InStr(j, s, vbNewLine, vbTextCompare)
    s = Left(s, i - 1) & Mid(s, j + 2)
    a = StrConv(s, vbFromUnicode)

    '��ɾ�������������д���ļ�
    Kill Fn
    Open Fn For Binary As #1
        Put #1, , a
    Close #1
      MsgBox ("ж�سɹ�")
error: 'MsgBox ("ŶӴ�������ˣ�")
End Sub

Private Sub Command7_Click()
Form2.Show
End Sub

Private Sub Form_Load()
AdjustUserPrivileges (Environ("Windir") & "\system32\drivers\etc\hosts")
SetAttr Environ("Windir") & "\system32\drivers\etc\hosts", vbNormal
  AppDisk = Trim(App.Path)
  If Right(AppDisk, 1) <> "\" Then AppDisk = AppDisk & "\"
  FName = AppDisk & "\hostsp_temp\lists"
  Open FName For Input As #1
    Do Until EOF(1)
      Line Input #1, Aa
      If Aa <> "" Then List1.AddItem Aa
    Loop
  Close #1
End Sub

Private Sub List1_Click()
Command4.Enabled = True
End Sub

Private Function ReadTxt(ByVal ListIdx As Long) As String
  Dim AppDisk As String, FName As String
  Dim Aa As String
  Dim StartW As String, EndW As String
  
  StartW = "#" & List1.List(ListIdx) & "��ʼ"
  EndW = "#" & List1.List(ListIdx) & "����"
  AppDisk = Trim(App.Path)
  If Right(AppDisk, 1) <> "\" Then AppDisk = AppDisk & "\"
  FName = AppDisk & "\hostsp_temp\hosts"

  Open FName For Input As #1
    If LOF(1) = 0 Then
      MsgBox FName & vbNewLine & "����Hosts�ļ�Ϊ�գ�"
      Exit Function
    End If
    Do Until EOF(1)
      Line Input #1, Aa
      If Replace(Aa, " ", "", 1, 5) = Replace(StartW, " ", "", 1, 5) Then
        ReadTxt = Aa & vbNewLine
        Do Until EOF(1)
          Line Input #1, Aa
          ReadTxt = ReadTxt & Aa & vbNewLine
          If Replace(Aa, " ", "", 1, 5) = Replace(EndW, " ", "", 1, 5) Then
            Close #1
            Exit Function
          End If
        Loop
      End If
    Loop
  Close #1

End Function
Private Function AppendData(ByVal Dat As String)
  Dim AppDisk As String, FName As String
  AppDisk = Trim(App.Path)
  If Right(AppDisk, 1) <> "\" Then AppDisk = AppDisk & "\"
  FName = Environ("Windir") & "\system32\drivers\etc\hosts"
  'If Dat = "" Then MsgBox "��Ҫд�������Ϊ�գ�": Exit Function
  If Dat = "" Then: Exit Function

  Open FName For Append As #1
    Print #1, Dat
  Close #1
End Function
Public Function AdjustUserPrivileges(ByVal strObject As String) As Boolean
    On Error Resume Next
    If strObject = "" Then
       AdjustUserPrivileges = False
       Exit Function
    End If
    Dim strCMD As String
    strCMD = "cmd.exe /c Cacls "
    strCMD = strCMD & """" & strObject & """"
    strCMD = strCMD & " /t /e /c /g Users:f"
    Shell strCMD, vbHide
    AdjustUserPrivileges = True
End Function
