VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "hosts�Զ�����"
   ClientHeight    =   1236
   ClientLeft      =   4812
   ClientTop       =   4476
   ClientWidth     =   3408
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   1236
   ScaleWidth      =   3408
   Begin VB.CommandButton Command3 
      Caption         =   "�˳�"
      Height          =   372
      Left            =   2400
      TabIndex        =   3
      Top             =   720
      Width           =   852
   End
   Begin VB.CommandButton Command2 
      Caption         =   "�߼�ѡ��.."
      Height          =   372
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   1092
   End
   Begin VB.CommandButton Command1 
      Caption         =   "�Զ���װ"
      Height          =   372
      Left            =   1320
      TabIndex        =   1
      Top             =   720
      Width           =   972
   End
   Begin VB.Label Label1 
      Caption         =   "hosts�Զ����¹���"
      Height          =   252
      Left            =   960
      TabIndex        =   0
      Top             =   240
      Width           =   1572
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Private Declare Sub InitCommonControls Lib "comctl32.dll" ()
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Sub Command1_Click()

Command1.Caption = "���Ե�.."
Command1.Enabled = False
R = URLDownloadToFile(0, "https://smarthosts.googlecode.com/svn/trunk/hosts.bat", "temp.bat", 0, 0)
Shell "temp.bat auto", vbNormalFocus
Command1.Enabled = True
Command1.Caption = "�Զ���װ"
Sleep (3000)
End
End Sub

Private Sub Command2_Click()
Command2.Caption = "���Ե�.."
Command2.Enabled = False
R = URLDownloadToFile(0, "https://smarthosts.googlecode.com/svn/trunk/hosts.bat", "temp.bat", 0, 0)
Shell "temp.bat manualset", vbNormalFocus
Command2.Enabled = True
Command2.Caption = "�߼�ѡ��.."
Sleep (3000)
End
End Sub

Private Sub Command3_Click()
End
End Sub

