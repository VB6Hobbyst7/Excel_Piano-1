VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ScoreData"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'�y���t�@�C�����C���|�[�g������G�N�X�|�[�g�����肷��N���X

Private CSettings As New Settings

'�s�A�m���[���Ɋy���f�[�^���C���|�[�g����
Public Sub Import_ScoreData_EMD(ByVal Path As String)
    '----------------------------------------------------------------
    '@Name
    '   Import_ScoreData_EMD
    '
    '@Param
    '   Path        : �C���|�[�g��̐�΃p�X�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   EMD�`���̊y���f�[�^��ǂݍ���ŕ\������B
    '
    '@Note
    '   �z��ɓ����Ă��鏇�Ԃ�
    '   �J�n�s, �A��, �J�n��, �x���V�e�B, �I����
    '
    '----------------------------------------------------------------
    
    With ThisWorkbook.Worksheets("�s�A�m���[��")
        .Range(.Cells(NOTE_LENGTH_ROW, PIANOROLL_START_COLUMN), .Cells(NOTE_LENGTH_ROW, Columns.Count)).ClearContents '�A�����폜
        .Range(.Cells(SUSTAIN_ROW, PIANOROLL_START_COLUMN), .Cells(SUSTAIN_ROW, Columns.Count)).ClearContents
        .Range(.Cells(PIANOROLL_START_ROW, PIANOROLL_START_COLUMN), .Cells(PIANOROLL_END_ROW, Columns.Count)).Clear   '�s�A�m���[�����̃f�[�^���ׂĂ�����
    
    
        Dim ScoreData() As String
        
        '�m�[�c�ƃT�X�e�C���̋�؂�̍s
        Dim SeparationRow As Long
        
        '�t�@�C�����J���ď��̎擾
        Dim n As Long: n = 0
        Open Path For Input As #1
        
            Do While Not EOF(1)
                '�ǂݍ���
                ReDim Preserve ScoreData(n)
                '��s���ǂݍ���
                Line Input #1, ScoreData(n)
                
                '�m�[�c�ƃT�X�e�C���f�[�^�̋�؂ꂩ���ׂ�
                If ScoreData(n) = String(30, "-") Then SeparationRow = n
                
                '�C���N�������g
                n = n + 1
            Loop
            
        Close #1
        
        
        '�擾�����������ƂɃf�[�^��z�u
        Call CSettings.Save_Title(ScoreData(0))  '�Ȗ�
        Call CSettings.Save_Tempo(CInt(ScoreData(1)))   '�e���|
        Call CSettings.Save_ScoreLength(ScoreData(2))   '�����̍ŏ��P��
        Call CSettings.Save_Rhythm(ScoreData(3))        '���q
        .Cells(PIANOROLL_START_ROW, CLng(ScoreData(4))).Interior.Color = CSettings.Get_EndColor   '�I����ݒ�

        For n = 6 To SeparationRow - 1 '5�Ԗڂ̗v�f�͋�؂�
            '�ǂݍ��񂾃f�[�^���u,�v�ŋ�؂�
            Dim Note_Data() As String: Note_Data = Split(ScoreData(n), ",") '�z��̗v�f����0,1,2,3,4��5��
            
            '�F��t����
            .Range(.Cells(CLng(Note_Data(0)), CLng(Note_Data(2))), .Cells(CLng(Note_Data(0)), CLng(Note_Data(4)))).Interior.Color = CSettings.Get_NoteColor
            
            '����Ɖ���������
            .Range(.Cells(CLng(Note_Data(0)), CLng(Note_Data(2))), .Cells(CLng(Note_Data(0)), CLng(Note_Data(4)))).Borders(xlEdgeTop).LineStyle = xlContinuous
            .Range(.Cells(CLng(Note_Data(0)), CLng(Note_Data(2))), .Cells(CLng(Note_Data(0)), CLng(Note_Data(4)))).Borders(xlEdgeTop).Weight = xlThin
            .Range(.Cells(CLng(Note_Data(0)), CLng(Note_Data(2))), .Cells(CLng(Note_Data(0)), CLng(Note_Data(4)))).Borders(xlEdgeBottom).LineStyle = xlContinuous
            .Range(.Cells(CLng(Note_Data(0)), CLng(Note_Data(2))), .Cells(CLng(Note_Data(0)), CLng(Note_Data(4)))).Borders(xlEdgeBottom).Weight = xlThin
            
            '�n�܂�ɍ���
            .Cells(CLng(Note_Data(0)), CLng(Note_Data(2))).Borders(xlEdgeLeft).LineStyle = xlContinuous
            .Cells(CLng(Note_Data(0)), CLng(Note_Data(2))).Borders(xlEdgeLeft).Weight = xlThin
            
            '�I���ɉE��
            .Cells(CLng(Note_Data(0)), CLng(Note_Data(4))).Borders(xlEdgeRight).LineStyle = xlContinuous
            .Cells(CLng(Note_Data(0)), CLng(Note_Data(4))).Borders(xlEdgeRight).Weight = xlThin
            
            '���x�ɕύX������ꍇ�A���f
            If Note_Data(1) <> "" Then
                .Range(.Cells(NOTE_LENGTH_ROW, CLng(Note_Data(2))), .Cells(NOTE_LENGTH_ROW, CLng(Note_Data(4)))).Value = Note_Data(1)
            End If
            
            '���̑傫����ݒ�
            .Cells(CLng(Note_Data(0)), CLng(Note_Data(2))).Value = Note_Data(3)
            
        Next n
        
        
        For n = SeparationRow + 1 To UBound(ScoreData)
            Dim Sustain_Data() As String: Sustain_Data = Split(ScoreData(n), ",")
            
            .Cells(SUSTAIN_ROW, CLng(Sustain_Data(0))).Value = Sustain_Data(1)
        Next n
    
    End With
    
End Sub

'�s�A�m���[������y���f�[�^�������o��
Public Sub Export_ScoreData_EMD(ByVal Path As String)
    '----------------------------------------------------------------
    '@Name
    '   Export_ScoreData_EMD
    '
    '@Param
    '   Path        : �C���|�[�g��̐�΃p�X�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   EMD�`���̊y���f�[�^���o�͂���B
    '
    '@Note
    '   �z��ɓ����Ă��鏇�Ԃ�
    '   �J�n�s, �A��, �J�n��, �x���V�e�B, �I����
    '
    '----------------------------------------------------------------
    
    
    '�I��肪�Ȃ��ꍇ�͏I��
    If PIANOROLL_END_COLUMN = -1 Then MsgBox ("�Ȃ̏I����ݒ肵�Ă��������B"): Exit Sub
    
    
    Dim Title As String     '�Ȗ�
    Dim Tempo As Integer    '���x
    Dim ScoreKind As String '�����̍ŏ��P��
    Dim Rhythm As String    '���q
    
    '��{���̎擾
    Title = CSettings.Get_Title
    Tempo = CSettings.Get_Tempo
    ScoreKind = CSettings.Get_ScoreLength
    Rhythm = CSettings.Get_Rhythm
    
    '�y���f�[�^��z�񉻂���
    Dim ScoreData() As String
    Dim FlgStart As Boolean '�n�܂肪���������ǂ���
    Dim Counter As Long     '��������ꏊ�����ӏ���������(�ŏI�o�͂̓w�b�_��������5����X�^�[�g)
    
    '�ϐ��̏�����
    FlgStart = False
    Counter = 6
    
    ReDim ScoreData(5) As String
    ScoreData(0) = Title    '�Ȗ�
    ScoreData(1) = CStr(Tempo)  '���x
    ScoreData(2) = ScoreKind    '�ŏ��̉����̎��
    ScoreData(3) = CStr(Rhythm) '���q
    ScoreData(4) = CStr(PIANOROLL_END_COLUMN) '�Ō�������Z���������
    ScoreData(5) = String(30, "-")
    
    Dim i As Integer, j As Integer
    PIANOROLL_END_COLUMN = ScoreData(4)
    
    With ThisWorkbook.Worksheets("�s�A�m���[��")
        
        '�m�[�c�f�[�^�̓���
        For i = PIANOROLL_START_ROW To PIANOROLL_END_ROW
            
            For j = PIANOROLL_START_COLUMN To PIANOROLL_END_COLUMN
                '�m�[�c���n�܂�Ƃ�
                If .Cells(i, j).Interior.Color = CSettings.Get_NoteColor And .Cells(i, j).Borders(xlEdgeLeft).LineStyle = xlContinuous Then
                    '�X�^�[�g�`�F�b�J�[��True��
                    FlgStart = True
                    
                    '�z��v�f���̕ύX
                    ReDim Preserve ScoreData(Counter) As String
                    
                    '�f�[�^�̑��(�J�n�s, �A��, �J�n��, �x���V�e�B)
                    ScoreData(Counter) = CStr(CStr(i) + "," + CStr(.Cells(NOTE_LENGTH_ROW, j).Value) + "," + CStr(j) + "," + CStr(.Cells(i, j).Value) + ",")
                    
                End If
                
                '�m�[�g���I���ꍇ
                If .Cells(i, j).Interior.Color = CSettings.Get_NoteColor And .Cells(i, j).Borders(xlEdgeRight).LineStyle = xlContinuous And FlgStart = True Then
                    '�X�^�[�g�`�F�b�J�[��False��
                    FlgStart = False
                    
                    '�I���̗����
                    ScoreData(Counter) = ScoreData(Counter) + CStr(j)
                    
                    Counter = Counter + 1
                End If
                
            Next j
            
        Next i
        
        '�m�[�c�̏I���̋�؂�
        ReDim Preserve ScoreData(Counter) As String
        ScoreData(Counter) = String(30, "-")
        
        
        '�T�X�e�C���������
        Counter = Counter + 1
        Dim c As Long: For c = PIANOROLL_START_COLUMN To PIANOROLL_END_COLUMN
            If UCase(.Cells(SUSTAIN_ROW, c).Value) = "S" Or UCase(.Cells(SUSTAIN_ROW, c).Value) = "E" Then
                ReDim Preserve ScoreData(Counter) As String
                ScoreData(Counter) = CStr(CStr(c) + "," + CStr(.Cells(SUSTAIN_ROW, c).Value))
                Counter = Counter + 1
            End If
        Next c
    
    End With
    
    '�t�@�C���ɏ����o��(�g���q��.emd(�܂�Excel Music Data�̗�))
    '�t�@�C�����J��(Output���[�h)
    Dim n As Long
    Open Path For Output As #1
        For n = 0 To UBound(ScoreData)
            Print #1, ScoreData(n)
        Next n
    Close #1
    
    
End Sub

