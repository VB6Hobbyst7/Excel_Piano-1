VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Wav"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'WAV�t�@�C�����������߂̃N���X

'--------------------------------------------------------------------------------------------
'Wave�t�@�C���̍\��
'<RIFFChunk> + <SubChunk> + <SubChunk>
'
'SubChunk�ɂ͂�������ނ�����(fmt , data, fact, LIST)
'fmt + data�̏ꍇ�ɂ̂ݑΉ�
'fact, LIST�ɂ��Ă̓p�X
'--------------------------------------------------------------------------------------------
'<RIFF>
'ChunkID        4bytes  "RIFF"
'ChunkSize      4bytes  ����ȍ~�̃t�@�C���T�C�Y (byte�P��)
'Format         4bytes  "WAVE"
'--------------------------------------------------------------------------------------------
'<fmt>
'SubchunkID     4bytes  "fmt ", �X�y�[�X�����4����
'SubchunkSize   4bytes  SubChunkData�̃T�C�Y, byte�P��, "fmt "�Ȃ�16
'AudioFormat    2bytes  �t�H�[�}�b�gID, ���j�APCM�Ȃ�1
'NumChannels    2bytes  �`�����l����, ���m������1, �X�e���I��2
'SampleRate     4bytes  �T���v�����O���[�g, Hz�P��, 8kHz, 44.1kHz, etc
'ByteRate       4bytes  �f�[�^���x, bytes/sec�P��, 44.1kHz �X�e���I, 16bits�Ȃ�176400
'BlockAlign     2bytes  �u���b�N�T�C�Y, bytes/sample�P��, �X�e���I, 16bits�Ȃ�4
'BitsPerSample  2bytes  �T���v���T�C�Y, bits/sample�P��, WAVE�t�H�[�}�b�g�ł�8bits or 16bits
'--------------------------------------------------------------------------------------------
'<data>
'SubchunkID     4bytes  "data"
'SubchunkSize   4bytes    SubChunkData�̃T�C�Y, byte�P��
'data
'�X�e���I�̏ꍇ�ALRLR�E�E�E�̏�
'8bits�Ȃ畄���Ȃ�(0�`255�A128������)
'16bits�Ȃ畄���� (-32768�`32767�A0������)
'--------------------------------------------------------------------------------------------

'<RIFF>
Private Type RIFF_CHUNK
    ChunkID As String * 4
    ChunkSize As Long
    Format As String * 4
End Type

'<fmt>
Private Type FMT_CHUNK
    SubchunkID As String * 4
    SubchunkSize As Long
    AudioFormat As Integer
    NumChannels As Integer
    SampleRate As Long
    ByteRate As Long
    BlockAlign As Integer
    BitsPerSample As Integer
End Type

'<Data>
Private Type DATA_CHUNK
    SubchunkID As String * 4
    SubchunkSize As Long
End Type


Public Sub Write_Wave_16bits_Mono(ByVal FilePath As String, ByVal Sampling As Long, ByRef Data() As Double)
    '----------------------------------------------------------------
    '@Name
    '   Write_Wave_16bits_Mono
    '
    '@Param
    '   FilePath    : �ۑ���̃t�@�C���p�X�B��΃p�X�B�g���q�܂ށB
    '   Sampling    : �T���v�����O���g���B
    '   Data()      : �g�`�f�[�^�B�z��œ��͂����B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   ���j�APCM, ���m����, 16bit��WAV�t�@�C���ɔg�`�������o���B
    '
    '@Note
    '   ���j�APCM, ���m����, 16bit�ȊO�͑S�������Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim Length As Long: Length = UBound(Data)
    
    Dim RIFFChunk As RIFF_CHUNK
    Dim fmtChunk As FMT_CHUNK
    Dim DataChunk As DATA_CHUNK
    
    
    RIFFChunk.ChunkID = "RIFF"
    RIFFChunk.ChunkSize = Length * 2 + 36
    RIFFChunk.Format = "WAVE"
   
    fmtChunk.SubchunkID = "fmt "
    fmtChunk.SubchunkSize = 16
    fmtChunk.AudioFormat = 1
    fmtChunk.NumChannels = 1
    fmtChunk.SampleRate = Sampling
    fmtChunk.ByteRate = Sampling * 2
    fmtChunk.BlockAlign = 2
    fmtChunk.BitsPerSample = 16
   
    DataChunk.SubchunkID = "data"
    DataChunk.SubchunkSize = Length * 2
    
    '�N���b�s���O
    Dim Output_Data() As Integer: ReDim Output_Data(UBound(Data)) As Integer
    Dim i As Long
    Dim tmp As Double
    For i = 0 To UBound(Data)
        tmp = (Data(i) + 1) / 2 * 65536
        If tmp > 65535 Then
            tmp = 65535
        ElseIf tmp < 0 Then
            tmp = 0
        End If
        Output_Data(i) = CInt((tmp - 0.5) - 32768)
    Next i
    
    
    Open FilePath For Binary As 1
        Put 1, , RIFFChunk
        Put 1, , fmtChunk
        Put 1, , DataChunk
        Put 1, , Output_Data
    Close 1
    
End Sub

'WAVE�t�@�C����ǂݍ���
Public Sub Read_Wave_16bits_Mono(ByVal WaveFilePath As String, ByRef WaveFormData() As Integer)
    '----------------------------------------------------------------
    '@Name
    '   Write_Wave_16bits_Mono
    '
    '@Param
    '   WaveFilePath        : �ǂݍ��ރt�@�C���̃p�X�B
    '   WaveFormData()      : �g�`�f�[�^�����Ă����ϐ��B�z��œ��͂����B
    '   Seconds             : �ǂݍ��ޕb���B
    '
    '@Return
    '   �Ȃ��B�����Ƃ��Đݒ肳�ꂽ�z��Ƀf�[�^�����ړ���B
    '
    '@Description
    '   ���j�APCM, ���m����, 16bit��WAV�t�@�C���ɔg�`��ǂ݂����B
    '
    '@Note
    '   ���j�APCM, ���m����, 16bit�ȊO�͑S�������Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim RIFFChunk As RIFF_CHUNK
    Dim fmtChunk As FMT_CHUNK
    Dim DataChunk As DATA_CHUNK

    
    Dim Sampling As Long
   
    Open WaveFilePath For Binary As #1  'WAV�t�@�C�����o�C�i���`���ŊJ��
        Get #1, , RIFFChunk 'RIFF���ʎq�̓ǂݍ���
        Get #1, , fmtChunk  'fmt���ʎq�̓ǂݍ���
        Get #1, , DataChunk '�g�`�f�[�^�Ɋւ�����̓ǂݍ���
        ReDim WaveFormData(DataChunk.SubchunkSize) As Integer
        Get #1, , WaveFormData      '�g�`�f�[�^�̓ǂݍ���
        
    Close #1
    
End Sub




Public Sub Write_Wave_16bits_Stereo(ByVal FilePath As String, ByVal Sampling As Long, ByRef Data_Right() As Double, ByRef Data_Left() As Double)
      '----------------------------------------------------------------
    '@Name
    '   Write_Wave_16bits_Stereo
    '
    '@Param
    '   FilePath    : �ۑ���̃t�@�C���p�X�B��΃p�X�B�g���q�܂ށB
    '   Sampling    : �T���v�����O���g���B
    '   DataRight() : �g�`�f�[�^�E�B�z��œ��͂����B
    '   Data_Left() : �g�`�f�[�^���B�z��œ��͂����B
    '
    '@Return
    '   �Ȃ��B
    '
    '@Description
    '   ���j�APCM, �X�e���I, 16bit��WAV�t�@�C���ɔg�`�������o���B
    '
    '@Note
    '   ���j�APCM, �X�e���I, 16bit�ȊO�͑S�������Ȃ��B
    '
    '----------------------------------------------------------------
    
    Dim Length As Long: Length = UBound(Data_Right) + UBound(Data_Left)
    
    Dim RIFFChunk As RIFF_CHUNK
    Dim fmtChunk As FMT_CHUNK
    Dim DataChunk As DATA_CHUNK
    
    
    RIFFChunk.ChunkID = "RIFF"
    RIFFChunk.ChunkSize = Length * 2 + 36
    RIFFChunk.Format = "WAVE"
   
    fmtChunk.SubchunkID = "fmt "
    fmtChunk.SubchunkSize = 16
    fmtChunk.AudioFormat = 1
    fmtChunk.NumChannels = 2
    fmtChunk.SampleRate = Sampling
    fmtChunk.ByteRate = Sampling * 2 * 2
    fmtChunk.BlockAlign = 4
    fmtChunk.BitsPerSample = 16
   
    DataChunk.SubchunkID = "data"
    DataChunk.SubchunkSize = Length * 2
    
    '�N���b�s���O
    Dim Clipping_Data_Right() As Integer: ReDim Clipping_Data_Right(UBound(Data_Right)) As Integer
    Dim i As Long
    Dim tmp_Right As Double
    For i = 0 To UBound(Data_Right)
        tmp_Right = (Data_Right(i) + 1) / 2 * 65536
        If tmp_Right > 65535 Then
            tmp_Right = 65535
        ElseIf tmp_Right < 0 Then
            tmp_Right = 0
        End If
        Clipping_Data_Right(i) = CInt((tmp_Right - 0.5) - 32768)
    Next i
    
    
    Dim Clipping_Data_Left() As Integer: ReDim Clipping_Data_Left(UBound(Data_Left)) As Integer
    Dim j As Long
    Dim tmp_Left As Double
    For j = 0 To UBound(Data_Left)
        tmp_Left = (Data_Left(j) + 1) / 2 * 65536
        If tmp_Left > 65535 Then
            tmp_Left = 65535
        ElseIf tmp_Left < 0 Then
            tmp_Left = 0
        End If
        Clipping_Data_Left(j) = CInt((tmp_Left - 0.5) - 32768)
    Next j
    
    
    Dim Output_Data() As Integer: ReDim Output_Data(Length) As Integer
    Dim n As Long: For n = 0 To Length
        If n Mod 2 = 0 Then '�����̎��͍��`�����l��
            Output_Data(n) = Clipping_Data_Right(n / 2)
        Else                '��̎��͉E�`�����l��
            Output_Data(n) = Clipping_Data_Left((n - 1) / 2)
        End If
    Next n
    
    Open FilePath For Binary As 1
        Put 1, , RIFFChunk
        Put 1, , fmtChunk
        Put 1, , DataChunk
        Put 1, , Output_Data
    Close 1
End Sub

