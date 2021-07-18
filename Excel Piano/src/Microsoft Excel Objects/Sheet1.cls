VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Sheet1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Option Explicit

Private CSettings As New Settings

'�_�u���N���b�N��MainForm���J��
Private Sub Worksheet_BeforeDoubleClick(ByVal Target As Range, Cancel As Boolean)
    
    MainForm.Show vbModeless
    
    '���͒��ɂ��Ȃ�
    Cancel = True
End Sub

Private Sub Worksheet_BeforeRightClick(ByVal Target As Range, Cancel As Boolean)
    '���[�h���uAdd�v�ȊO�͏���
    If Mode <> "Add" Then Exit Sub
    
    Dim StartRow As Long: StartRow = Target.Rows(1).Row
    Dim EndRow As Long: EndRow = Target.Rows(Target.Rows.Count).Row
    Dim StartColumn As Long: StartColumn = Target.Columns(1).Column
    Dim EndColumn As Long: EndColumn = Target.Columns(Target.Columns.Count).Column
    
    '��͈͑I���͂͂���
    If EndRow - StartRow > 1 And EndColumn - StartColumn > 1 Then Exit Sub
    
    '�I�����钷�����擾
    Dim Select_Length As Long: Select_Length = CSettings.Get_ScoreLength_Assist(AssistMode)
    ThisWorkbook.Worksheets("�s�A�m���[��").Range(Cells(StartRow, StartColumn), Cells(StartRow, StartColumn + Select_Length - 1)).Select
    
    Cancel = True
    
End Sub

'�x���V�e�B�[�̒l���ύX���ꂽ�Ƃ��ɔ���
Private Sub Worksheet_Change(ByVal Target As Range)
    
    '�C�x���g��ߑ����Ȃ�
    Application.EnableEvents = False
    
    Dim StartRow As Long, EndRow As Long
    Dim StartColumn As Long, EndColumn As Long
    Dim BeforeChangeCell As Range
    
    StartRow = Target(1).Row
    EndRow = Target(Target.Count).Row
    StartColumn = Target(1).Column
    EndColumn = Target(Target.Count).Column
  
    
    If EndColumn - StartColumn <> 0 Or EndRow - StartRow <> 0 Then Application.EnableEvents = True: Exit Sub
    If StartColumn = KEYBOARD_COLUMN Or StartRow = NOTE_LENGTH_ROW Or EndRow > PIANOROLL_END_ROW Then Application.EnableEvents = True: Exit Sub
    
    
    If Target.Value = "" Or IsNumeric(Target.Value) = False Then Application.EnableEvents = True: Exit Sub
    Dim Volume As Integer: Volume = CInt(Target.Value)
    If Volume < 0 Or Volume > 100 Then Volume = 80
    
    With ThisWorkbook.Worksheets("�s�A�m���[��")
        '�m�[�c�̕����ɓ��͂���Ă����Ƃ��̂ݎ��s
        If .Cells(StartRow, StartColumn).Interior.Color = CSettings.Get_NoteColor() Then
            '�m�[�c�̊J�n�_����Ȃ�������ŏ��ɖ߂��ē���
            If .Cells(StartRow, StartColumn).Borders(xlEdgeLeft).LineStyle <> xlContinuous Then
                Dim BeginCellColumn As Long: BeginCellColumn = StartColumn
                Do Until (.Cells(StartRow, BeginCellColumn).Borders(xlEdgeLeft).LineStyle = xlContinuous Or BeginCellColumn <= PIANOROLL_START_COLUMN)
                    .Cells(StartRow, BeginCellColumn).ClearContents
                    BeginCellColumn = BeginCellColumn - 1
                Loop
                .Cells(StartRow, BeginCellColumn).Value = Volume
            End If
        Else
            '���̓��[�h�Ƃ��ē����ꂽ���l���特���̎�ނ𔻒f
            Application.EnableEvents = True
            Dim Mode_Backup As String: Mode_Backup = Mode
            Mode = "Add"
            '�I�����钷�����擾
            Dim Add_Score As String: Add_Score = "4������"
            Select Case Target.Value
                Case 0
                    Add_Score = "�S����"
                Case 0.5
                    Add_Score = "�t�_�S����"
                Case 2
                    Add_Score = "2������"
                Case 2.5
                    Add_Score = "�t�_2������"
                Case 4
                    Add_Score = "4������"
                Case 4.5
                    Add_Score = "�t�_4������"
                Case 8
                    Add_Score = "8������"
                Case 8.5
                    Add_Score = "�t�_8������"
                Case 16
                    Add_Score = "16������"
                Case 16.5
                    Add_Score = "�t�_16������"
            End Select
            Dim Select_Length As Long: Select_Length = CSettings.Get_ScoreLength_Assist(Add_Score)
            ThisWorkbook.Worksheets("�s�A�m���[��").Range(Cells(StartRow, StartColumn), Cells(StartRow, StartColumn + Select_Length - 1)).Select
            Mode = Mode_Backup
        End If
        
    End With
    
    
    Application.EnableEvents = True
    
End Sub

'�I��͈͂��ύX���ꂽ�Ƃ��ɔ���(���͗p)
Private Sub Worksheet_SelectionChange(ByVal Target As Range)
    If CSettings.Is_In_Scope(Target) = False Then Exit Sub
    
    
    Dim StartRow As Long, EndRow As Long
    Dim StartColumn As Long, EndColumn As Long
    StartRow = Selection(1).Row
    EndRow = Selection(Selection.Count).Row
    StartColumn = Selection(1).Column
    EndColumn = Selection(Selection.Count).Column
    
    
    '�G���h�}�[�J�[�̓��͂̎�
    If Mode = "Add" And NoteOrEnd = "End" Then
        '�͈͑I���͏���
        If EndColumn - StartColumn <> 0 Or EndRow - StartRow <> 0 Then Exit Sub
        With ThisWorkbook.Worksheets("�s�A�m���[��")
            PIANOROLL_END_COLUMN = CSettings.Get_LastColumn
            If PIANOROLL_END_COLUMN = -1 Then   '���������I��肪�ݒ肳��Ă��Ȃ��Ƃ�
                .Cells(PIANOROLL_START_ROW, StartColumn).Interior.Color = CSettings.Get_EndColor
            Else    '�I��肪���݂��Ă���ꍇ
                .Cells(PIANOROLL_START_ROW, PIANOROLL_END_COLUMN).Clear
                .Cells(PIANOROLL_START_ROW, StartColumn).Interior.Color = CSettings.Get_EndColor
            End If
        End With
        
        Exit Sub
    End If
    
    '�m�[�c�̓��͂̎�
    If Mode = "Select" Then

    ElseIf Mode = "Add" Then
        Dim DefaultVolume As Integer: DefaultVolume = 80
        With ThisWorkbook.Worksheets("�s�A�m���[��")
            '��U���ׂăN���A
            .Range(Cells(StartRow, StartColumn), Cells(EndRow, EndColumn)).ClearFormats
            
            Dim i As Integer
            
            For i = StartRow To EndRow
                Range(Cells(i, StartColumn), Cells(i, EndColumn)).Interior.Color = CSettings.Get_NoteColor()
                '�r���������ė̈�𖾊m�ɂ���
                .Range(Cells(i, StartColumn), Cells(i, EndColumn)).Borders(xlEdgeTop).LineStyle = xlContinuous   '��̐�
                .Range(Cells(i, StartColumn), Cells(i, EndColumn)).Borders(xlEdgeTop).Weight = xlThin
                
                .Range(Cells(i, StartColumn), Cells(i, EndColumn)).Borders(xlEdgeBottom).LineStyle = xlContinuous    '���̐�
                .Range(Cells(i, StartColumn), Cells(i, EndColumn)).Borders(xlEdgeBottom).Weight = xlThin
                
                .Cells(i, EndColumn).Borders(xlEdgeRight).LineStyle = xlContinuous   '�E�̐�
                .Cells(i, EndColumn).Borders(xlEdgeRight).Weight = xlThin
                
                .Cells(i, StartColumn).Borders(xlEdgeLeft).LineStyle = xlContinuous  '���̐�
                .Cells(i, StartColumn).Borders(xlEdgeLeft).Weight = xlThin
                
                .Cells(i, StartColumn).Value = DefaultVolume
                
            Next i
            
        End With
        
    ElseIf Mode = "Delete" Then
        With ThisWorkbook.Worksheets("�s�A�m���[��")
            '�w��͈̔͂��N���A����
            .Range(Cells(StartRow, StartColumn), Cells(EndRow, EndColumn)).Clear
            
            Dim j As Integer
            
            For j = StartRow To EndRow
                If .Cells(j, StartColumn - 1).Interior.Color = CSettings.Get_NoteColor() And .Cells(j, StartColumn - 1).Borders(xlEdgeRight).LineStyle = xlLineStyleNone Then
                    .Cells(j, StartColumn - 1).Borders(xlEdgeRight).LineStyle = xlContinuous
                    .Cells(j, StartColumn - 1).Borders(xlEdgeRight).Weight = xlThin
                End If
                
                If .Cells(j, EndColumn + 1).Interior.Color = CSettings.Get_NoteColor() And Cells(j, EndColumn + 1).Borders(xlEdgeLeft).LineStyle = xlLineStyleNone Then
                    .Cells(j, EndColumn + 1).Borders(xlEdgeLeft).LineStyle = xlContinuous
                    .Cells(j, EndColumn + 1).Borders(xlEdgeLeft).Weight = xlThin
                End If
            Next j
        End With
        
    ElseIf Mode = "Divide" Then
        With ThisWorkbook.Worksheets("�s�A�m���[��")
            '�͈͑I���͏���
            If EndColumn - StartColumn <> 0 Or EndRow - StartRow <> 0 Then Exit Sub
            
             '�I�������Z���̉E���Ƀm�[�g������ΐ���ǉ�����
            If .Cells(StartRow, StartColumn).Interior.Color = CSettings.Get_NoteColor() And .Cells(StartRow, StartColumn + 1).Interior.Color = CSettings.Get_NoteColor() Then
                .Cells(StartRow, StartColumn).Borders(xlEdgeRight).LineStyle = xlContinuous
                .Cells(StartRow, StartColumn).Borders(xlEdgeRight).Weight = xlThin
                
                .Cells(StartRow, StartColumn + 1).Borders(xlEdgeLeft).LineStyle = xlContinuous
                .Cells(StartRow, StartColumn + 1).Borders(xlEdgeLeft).Weight = xlThin
                
                .Cells(StartRow, StartColumn + 1).Value = 80
            End If
        End With
        
    ElseIf Mode = "Join" Then
        With ThisWorkbook.Worksheets("�s�A�m���[��")
            '�͈͑I���͏���
            If EndColumn - StartColumn <> 0 Or EndRow - StartRow <> 0 Then Exit Sub
            
             '�I�������Z���̌r���A�܂��͑I�������Z���̍����̌r�����uxlEdgeRight�v�ɂȂ��Ă���Ό���
            If .Cells(StartRow, StartColumn).Borders(xlEdgeRight).LineStyle = xlContinuous And .Cells(StartRow, StartColumn + 1).Interior.Color = CSettings.Get_NoteColor() Then
                .Cells(StartRow, StartColumn).Borders(xlEdgeRight).LineStyle = xlLineStyleNone
                .Cells(StartRow, StartColumn + 1).Value = ""
                
            ElseIf .Cells(StartRow, StartColumn - 1).Borders(xlEdgeRight).LineStyle = xlContinuous And .Cells(StartRow, StartColumn + 1).Interior.Color = CSettings.Get_NoteColor() Then
                .Cells(StartRow, StartColumn - 1).Borders(xlEdgeRight).LineStyle = xlLineStyleNone
                .Cells(StartRow, StartColumn + 1).Value = ""
                
            End If
        End With
        
    End If



End Sub
