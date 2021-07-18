VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Settings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'�e��ݒ��v���p�e�B��ǂݍ��ݐݒ肷��B

Public Function Get_NoteColor() As Long
    '----------------------------------------------------------------
    '@Name
    '   Get_NoteColor
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڎ擾����RGB�l��Ԃ��B
    '
    '@Description
    '   �m�[�c�̐F��RGB�l�𒷐����^�ŕԂ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_NoteColor = CLng(ThisWorkbook.Worksheets("�ݒ�").Cells(3, 3).Value)
    
    
End Function

Public Function Get_EndColor() As Long
    '----------------------------------------------------------------
    '@Name
    '   Get_EndColor
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڎ擾����RGB�l��Ԃ��B
    '
    '@Description
    '   �G���h�}�[�J�[�̐F��RGB�l�𒷐����^�ŕԂ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_EndColor = CLng(ThisWorkbook.Worksheets("�ݒ�").Cells(4, 3).Value)
    
    
End Function


Public Function Get_ScoreLength() As String
    '----------------------------------------------------------------
    '@Name
    '   Get_ScoreLength
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڎ擾���������̍ŏ��P�ʂ�Ԃ��B
    '
    '@Description
    '   �����̍ŏ��P�ʂ��擾����B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_ScoreLength = CStr(ThisWorkbook.Worksheets("�ݒ�").Cells(7, 3).Value)
    
End Function

Public Function Get_Tempo() As Integer
    '----------------------------------------------------------------
    '@Name
    '   Get_Tempo
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڎ擾�������x��Ԃ��B
    '
    '@Description
    '   �Ȃ̑���(=�e���|)���擾����
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_Tempo = CInt(ThisWorkbook.Worksheets("�ݒ�").Cells(8, 3).Value)
    
End Function

Public Function Get_Rhythm() As String
    '----------------------------------------------------------------
    '@Name
    '   Get_Rhythm
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڎ擾�������q��Ԃ��B
    '
    '@Description
    '   ���q���擾����
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_Rhythm = CStr(ThisWorkbook.Worksheets("�ݒ�").Cells(9, 3).Value)
    
End Function

Public Function Get_Title() As String
    '----------------------------------------------------------------
    '@Name
    '   Get_Title
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڋȖ���Ԃ��B
    '
    '@Description
    '   �Ȗ���ǂݍ��ށB
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_Title = CStr(ThisWorkbook.Worksheets("�ݒ�").Cells(12, 3).Value)
    
End Function

Public Function Get_SavePath() As String
    '----------------------------------------------------------------
    '@Name
    '   Get_SavePath
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   ���ڕۑ����Ԃ��B
    '
    '@Description
    '   �ۑ���p�X��ǂݍ��ށB
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_SavePath = CStr(ThisWorkbook.Worksheets("�ݒ�").Cells(13, 3).Value)
    
End Function

Public Function Get_UseInstrument()
    '----------------------------------------------------------------
    '@Name
    '   Get_UseInstrument
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   �y�햼���Ԃ�B
    '
    '@Description
    '   �o�͂Ɏg���y�햼���擾�B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Get_UseInstrument = CStr(ThisWorkbook.Worksheets("�ݒ�").Cells(18, 3).Value)
    
End Function

Public Sub Save_NoteColor(ByVal lngColor As Long)
    '----------------------------------------------------------------
    '@Name
    '   Save_NoteColor
    '
    '@Param
    '   lngColor    : �ۑ�����F�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �m�[�c�̐F��RGB�l�𒷐����^�Őݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(3, 3).Value = lngColor
    
End Sub

Public Sub Save_EndColor(ByVal lngColor As Long)
     '----------------------------------------------------------------
    '@Name
    '   Save_EndColor
    '
    '@Param
    '   lngColor    : �ۑ�����F�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �G���h�}�[�J�[�̐F��RGB�l�𒷐����^�Őݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(4, 3).Value = lngColor
    
End Sub

Public Sub Save_ScoreLength(ByVal ScoreLength As String)
    '----------------------------------------------------------------
    '@Name
    '   Save_ScoreLength
    '
    '@Param
    '   ScoreLength     : �����̍ŏ��P�ʁB
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �����̍ŏ��P�ʂ�ݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(7, 3).Value = ScoreLength
    
End Sub

Public Sub Save_Tempo(ByVal Tempo As Integer)
    '----------------------------------------------------------------
    '@Name
    '   Save_Tempo
    '
    '@Param
    '   Tempo   : �e���|�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �e���|��ݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(8, 3).Value = Tempo
    
End Sub

Public Sub Save_Rhythm(ByVal Rhythm As String)
    '----------------------------------------------------------------
    '@Name
    '   Save_Rhythm
    '
    '@Param
    '   Rhythm      : ���q�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   ���q��ݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(9, 3).Value = Rhythm
    
End Sub

Public Sub Save_Title(ByVal Title As String)
    '----------------------------------------------------------------
    '@Name
    '   Save_Title
    '
    '@Param
    '   Title       : �^�C�g���B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �^�C�g����ݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(12, 3).Value = Title
    
End Sub

Public Sub Save_SavePath(ByVal SavePath As String)
    '----------------------------------------------------------------
    '@Name
    '   Save_SavePath
    '
    '@Param
    '   SavePath    : �ۑ�����F�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �ۑ����ݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    ThisWorkbook.Worksheets("�ݒ�").Cells(13, 3).Value = SavePath
    
End Sub


Public Function Save_UseInstrument(ByVal Ins As String)
    '----------------------------------------------------------------
    '@Name
    '   Save_UseInstrument
    '
    '@Param
    '   Ins         : �y�햼�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �o�͂Ɏg���y�햼��ݒ�V�[�g�ɕۑ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
End Function


Public Function Get_OneCellSeconds(ByVal BPM As Integer, ScoreType As String) As Double
    '----------------------------------------------------------------
    '@Name
    '   Get_OneCellSeconds
    '
    '@Param
    '   BPM             : ���t���x�B
    '   ScoreType       : �����̍ŏ��P�ʁB
    '
    '@Return
    '   ���ڒl����    : 1�Z������߂�b���Ԃ�
    '
    '@Description
    '   �����d�ˍ��킹�Ęa���ɂ��邽�߂̊֐��B
    '
    '@Note
    '   120BPM��1���Ԃ�4��������120��
    '   16���������ŏ��Ƃ���Ɓ���������4������(����16������)
    '   60�b��120��1�b��2�B�܂�1�Z��������0.5�b�ł���B
    '   ���l�ɂ���BPM = K �̎��A1�Z��������̕b����(60 / K) / (�����ŗL�̒l)�ƂȂ�
    '
    '----------------------------------------------------------------
    
    '�����̍ŏ��P�ʂ��特���ŗL�̒l�����߂�
    Dim div As Double
    If ScoreType = "�S" Then
        div = 1 / 4
    ElseIf ScoreType = "2��" Then
        div = 1 / 2
    ElseIf ScoreType = "4��" Then
        div = 1
    ElseIf ScoreType = "8��" Then
        div = 2
    ElseIf ScoreType = "16��" Then
        div = 4
    ElseIf ScoreType = "32��" Then
        div = 8
    ElseIf ScoreType = "64��" Then
        div = 16
    Else
        div = 4
    End If
    
    Get_OneCellSeconds = ((60 / BPM) / div)
    
End Function

Public Function Get_LastColumn() As Long
    '----------------------------------------------------------------
    '@Name
    '   Get_LastColumn
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   LastPos     : �ŏI��̗�ԍ��B
    '
    '@Description
    '   �Ȃ̏I���̗���擾����B������Ȃ��ꍇ��-1��Ԃ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim LastPos As Long
    Dim Is_Find As Boolean: Is_Find = False
    
    Dim i As Long
    For i = PIANOROLL_START_COLUMN To Columns.Count
        If ThisWorkbook.Worksheets("�s�A�m���[��").Cells(PIANOROLL_START_ROW, i).Interior.Color = Get_EndColor() Then
            Is_Find = True
            LastPos = i
            Exit For
        End If
    Next i
    
    If Is_Find = False Then LastPos = -1
    
    
    Get_LastColumn = LastPos
    
    
End Function

Public Function Is_In_Scope(ByVal TargetRange As Range) As Boolean
    '----------------------------------------------------------------
    '@Name
    '   Is_In_Scope
    '
    '@Param
    '   TargetRange     : �I��͈́B
    '
    '@Return
    '   Result          : 0�ŗL���B����ȊO�͖����B
    '
    '@Description
    '   �I��͈͂��m�[�c����͂���̂ɗL�����ǂ�����Boolean�^�ŕԂ��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------

    Dim StartRow As Long: StartRow = TargetRange.Rows(1).Row
    Dim EndRow As Long: EndRow = TargetRange.Rows(TargetRange.Rows.Count).Row
    Dim StartColumn As Long: StartColumn = TargetRange.Columns(1).Column
    Dim EndColumn As Long: EndColumn = TargetRange.Columns(TargetRange.Columns.Count).Column
    Dim Result As Long: Result = 0
    
    
    If StartRow = NOTE_LENGTH_ROW Then Result = Result + 1
    If StartColumn = KEYBOARD_COLUMN Then Result = Result + 1
    If EndRow = KEYBOARD_COLUMN Then Result = Result + 1
    If EndRow > PIANOROLL_END_ROW Then Result = Result + 1
    If EndColumn = 1 Then Result = Result + 1
    
    Is_In_Scope = Not CBool(Result)
    
End Function

Public Function Get_ScoreLength_Assist(ByVal ScoreType As String) As Long
    '----------------------------------------------------------------
    '@Name
    '   Get_ScoreLength_Assist
    '
    '@Param
    '   ScoreType       : ���̓A�V�X�g�Ɏg�������̎�ށB
    '
    '@Return
    '   CellLength      : ���͂Ɏg���Z���̒����B
    '
    '@Description
    '   ���̓A�V�X�g�Ɏg�������̎�ނ���ł����ރZ���̒������v�Z�B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim CellLength As Long
    Dim ScoreLength As String: ScoreLength = Get_ScoreLength()
    Dim WholeCellCount As Integer  '�S�������g���Z���̐�
    
    '��U�S���������g���Z���̐����Z�b�g
    Select Case ScoreLength
        Case "�S"
            WholeCellCount = 1
        Case "2��"
            WholeCellCount = 2
        Case "4��"
            WholeCellCount = 4
        Case "8��"
            WholeCellCount = 8
        Case "16��"
            WholeCellCount = 16
        Case "32��"
            WholeCellCount = 32
        Case "64��"
            WholeCellCount = 64
    End Select
    
    Select Case ScoreType
        Case "�S����"
            CellLength = WholeCellCount * 1
        Case "2������"
            CellLength = WholeCellCount / 2
        Case "4������"
            CellLength = WholeCellCount / 4
        Case "8������"
            CellLength = WholeCellCount / 8
        Case "16������"
            CellLength = WholeCellCount / 16
        Case "�t�_�S����"
            CellLength = WholeCellCount / 1 + WholeCellCount / 2
        Case "�t�_2������"
            CellLength = WholeCellCount / 2 + WholeCellCount / 4
        Case "�t�_4������"
            CellLength = WholeCellCount / 4 + WholeCellCount / 8
        Case "�t�_8������"
            CellLength = WholeCellCount / 8 + WholeCellCount / 16
        Case "�t�_16������"
            CellLength = WholeCellCount / 16 + WholeCellCount / 32
    End Select
    
    Get_ScoreLength_Assist = CellLength
    
End Function

Public Sub Save_Settings_All()
    '----------------------------------------------------------------
    '@Name
    '   Save_Settings
    '
    '@Param
    '   �Ȃ��B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   �ݒ����ۑ�����B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    '�ȉ��A�ݒ�V�[�g�̍��ڏォ�珇�ɕۑ�
    With ThisWorkbook.Worksheets("�ݒ�")
        .Cells(3, 3).Value = MainForm.NoteColor_Label.BackColor '�m�[�g�J���[
        .Cells(4, 3).Value = MainForm.EndColor_Label.BackColor  '�G���h�}�[�N�J���[
        .Cells(7, 3).Value = MainForm.ScoreLength_ComboBox.Text '�����̍ŏ��P��
        .Cells(8, 3).Value = MainForm.Tempo_TextBox.Text        '���x(�e���|)
        .Cells(9, 3).Value = MainForm.Rhythm_ComboBox.Text      '���q
        .Cells(12, 3).Value = MainForm.Title_TextBox.Text       '�^�C�g��(�Ȗ�)
        .Cells(18, 3).Value = MainForm.Instrument_ComboBox.Text '�g�p�y��
    End With
    
    
End Sub

Public Sub Set_ComboBox_InstrumentList(ByRef TargetComboBox As ComboBox)
    '----------------------------------------------------------------
    '@Name
    '   Set_ComboBox_InstrumentList
    '
    '@Param
    '   TargetComboBox      : �y�탊�X�g��ݒ肷��R���{�{�b�N�X�B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   SoundSource�t�H���_�ɂ���y�햼���擾���R���{�{�b�N�X�ɃZ�b�g����B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim strPattern As String, strInstrument As String
    strPattern = Left(ThisWorkbook.Path, InStrRev(ThisWorkbook.Path, "\", InStrRev(ThisWorkbook.Path, "\") - 1) - 1) + "\SoundSource\"
     
    strInstrument = Dir(strPattern, vbDirectory)

    Do While Len(strInstrument) > 0
        If GetAttr(strPattern & strInstrument) And vbDirectory Then
            If strInstrument <> "." And strInstrument <> ".." Then
                TargetComboBox.AddItem (strInstrument)
            End If
        End If
        strInstrument = Dir()
    Loop
    
    
End Sub


Public Sub Set_ComboBox_ScoreLength(ByRef TargetComboBox As ComboBox)
    '----------------------------------------------------------------
    '@Name
    '   Set_ComboBox_ScoreLength
    '
    '@Param
    '   TargetComboBox : ���ڂ�ݒ肷��R���{�{�b�N�X�B
    '
    '@Return
    '   �Ȃ��B���ڃR���{�{�b�N�X�ɍ��ڂ��ݒ肳���B
    '
    '@Description
    '   �����̍ŏ��P��(16�������Ƃ�)���w��̃R���{�{�b�N�X�ɐݒ肷��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim Origin As Range: Set Origin = ThisWorkbook.Worksheets("�ݒ�").Cells(16, 2)
    
    Dim i As Long
    For i = 1 To 7
        TargetComboBox.AddItem (CStr(Origin.Offset(0, i).Value))
    Next i
    
    '�f�t�H���g��\��
    TargetComboBox.Text = CStr(Origin.Offset(0, 5).Value)
    
End Sub

Public Sub Set_ComboBox_Rhythm(ByRef TargetComboBox As ComboBox)
    '----------------------------------------------------------------
    '@Name
    '   Set_ComboBox_ScoreLength
    '
    '@Param
    '   TargetComboBox : ���ڂ�ݒ肷��R���{�{�b�N�X�B
    '
    '@Return
    '   �Ȃ��B���ڃR���{�{�b�N�X�ɍ��ڂ��ݒ肳���B
    '
    '@Description
    '   ���q(4/4���q�Ƃ�)���w��̃R���{�{�b�N�X�ɐݒ肷��B
    '
    '@Note
    '   �Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim Origin As Range: Set Origin = ThisWorkbook.Worksheets("�ݒ�").Cells(17, 2)
    
    Dim i As Long
    For i = 1 To 6
        TargetComboBox.AddItem (CStr(Origin.Offset(0, i).Value))
    Next i
    
    '�f�t�H���g��\��
    TargetComboBox.Text = CStr(Origin.Offset(0, 2).Value)
End Sub
