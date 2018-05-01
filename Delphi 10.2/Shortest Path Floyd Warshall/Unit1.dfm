object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '::. Floyd Warshall'
  ClientHeight = 554
  ClientWidth = 618
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 185
    Align = alTop
    BevelOuter = bvNone
    Color = clTeal
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 597
    object Label1: TLabel
      Left = 8
      Top = 71
      Width = 64
      Height = 16
      Caption = 'Titik Awal'
    end
    object Label2: TLabel
      Left = 8
      Top = 123
      Width = 77
      Height = 16
      Caption = 'Titik Tujuan'
    end
    object Label14: TLabel
      Left = 5
      Top = 13
      Width = 584
      Height = 23
      Caption = 'SIMULASI PENCARIAN JALUR TERPENDEK MENUJU LOKASI WISATA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 61
      Top = 42
      Width = 477
      Height = 23
      Caption = 'DENGAN MENGGUNAKAN ALGORITMA FLOYD WARSHALL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 93
      Width = 137
      Height = 24
      MaxLength = 1
      TabOrder = 0
      OnChange = ComboBox1Change
      Items.Strings = (
        'Anjungan'
        'Taman Ria'
        'Rumah Adat souraja'
        'Jembatan Kuning'
        'Gong Perdamaian'
        'Wisata Sate Mobil'
        'Pantai Talise'
        'Air Terjun Wombo'
        'Tanggul Nosarara'
        'Matantimali')
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 142
      Width = 137
      Height = 24
      MaxLength = 1
      TabOrder = 1
      OnChange = ComboBox2Change
    end
    object BitBtn1: TBitBtn
      Left = 164
      Top = 93
      Width = 75
      Height = 25
      Caption = 'Poses'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object Memo1: TMemo
      AlignWithMargins = True
      Left = 265
      Top = 80
      Width = 344
      Height = 86
      ScrollBars = ssVertical
      TabOrder = 3
    end
    object BitBtn2: TBitBtn
      Left = 164
      Top = 124
      Width = 75
      Height = 25
      Caption = 'Reset'
      TabOrder = 4
      OnClick = BitBtn2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 185
    Width = 618
    Height = 369
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 597
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 618
      Height = 369
      Align = alClient
      Stretch = True
      ExplicitLeft = 5
      ExplicitTop = 6
      ExplicitWidth = 597
    end
    object sNodeTamanRia: TShape
      Left = 193
      Top = 104
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeRumahAdatSouraja: TShape
      Left = 57
      Top = 232
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeGongPerdamaian: TShape
      Left = 238
      Top = 288
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeWisataSateMobil: TShape
      Left = 335
      Top = 176
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeAirTerjunWombo: TShape
      Left = 377
      Top = 320
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeJembatanKuning: TShape
      Left = 281
      Top = 24
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeTanggulNosarara: TShape
      Left = 509
      Top = 160
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeMatantimali: TShape
      Left = 497
      Top = 288
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodePantaiTalise: TShape
      Left = 401
      Top = 72
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object sNodeAnjungan: TShape
      Left = 57
      Top = 48
      Width = 15
      Height = 15
      Brush.Color = clBlack
      Shape = stCircle
    end
    object Label3: TLabel
      Left = 35
      Top = 26
      Width = 61
      Height = 16
      Caption = 'Anjungan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 168
      Top = 82
      Width = 66
      Height = 16
      Caption = 'Taman Ria'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 18
      Top = 253
      Width = 67
      Height = 16
      Caption = 'Rumah Adat Souraja'
      WordWrap = True
    end
    object Label6: TLabel
      Left = 184
      Top = 309
      Width = 113
      Height = 16
      Caption = 'Gong Perdamaian'
    end
    object Label7: TLabel
      Left = 237
      Top = 6
      Width = 111
      Height = 16
      Caption = 'Jembatan Kuning'
    end
    object Label8: TLabel
      Left = 284
      Top = 154
      Width = 119
      Height = 16
      Caption = 'Wisata Sate Mobil'
    end
    object Label9: TLabel
      Left = 382
      Top = 50
      Width = 82
      Height = 16
      Caption = 'Pantai Talise'
    end
    object Label10: TLabel
      Left = 339
      Top = 341
      Width = 115
      Height = 16
      Caption = 'Air Terjun Wombo'
    end
    object Label11: TLabel
      Left = 509
      Top = 124
      Width = 58
      Height = 32
      Caption = 'Tanggul Nosarara'
      WordWrap = True
    end
    object Label12: TLabel
      Left = 497
      Top = 309
      Width = 75
      Height = 16
      Caption = 'Matantimali'
    end
    object lAC: TLabel
      Left = 35
      Top = 136
      Width = 16
      Height = 16
      Caption = '15'
    end
    object lAB: TLabel
      Left = 110
      Top = 91
      Width = 16
      Height = 16
      Caption = '10'
    end
    object Label13: TLabel
      Left = 177
      Top = 19
      Width = 16
      Height = 16
      Caption = '08'
    end
    object lBC: TLabel
      Left = 105
      Top = 158
      Width = 16
      Height = 16
      Caption = '18'
    end
    object lBD: TLabel
      Left = 229
      Top = 53
      Width = 16
      Height = 16
      Caption = '07'
    end
    object LCE: TLabel
      Left = 136
      Top = 280
      Width = 16
      Height = 16
      Caption = '20'
    end
    object lBF: TLabel
      Left = 247
      Top = 153
      Width = 16
      Height = 16
      Caption = '15'
    end
    object lBE: TLabel
      Left = 195
      Top = 202
      Width = 16
      Height = 16
      Caption = '21'
    end
    object lDG: TLabel
      Left = 351
      Top = 35
      Width = 16
      Height = 16
      Caption = '18'
    end
    object lEH: TLabel
      Left = 303
      Top = 316
      Width = 16
      Height = 16
      Caption = '15'
    end
    object lEF: TLabel
      Left = 274
      Top = 222
      Width = 16
      Height = 16
      Caption = '12'
    end
    object lFG: TLabel
      Left = 352
      Top = 105
      Width = 16
      Height = 16
      Caption = '09'
    end
    object lFH: TLabel
      Left = 339
      Top = 251
      Width = 16
      Height = 16
      Caption = '23'
    end
    object lFJ: TLabel
      Left = 405
      Top = 238
      Width = 16
      Height = 16
      Caption = '28'
    end
    object lHJ: TLabel
      Left = 448
      Top = 323
      Width = 16
      Height = 16
      Caption = '08'
    end
    object lIJ: TLabel
      Left = 520
      Top = 223
      Width = 16
      Height = 16
      Caption = '05'
    end
    object lFI: TLabel
      Left = 422
      Top = 179
      Width = 16
      Height = 16
      Caption = '17'
    end
    object lGI: TLabel
      Left = 466
      Top = 102
      Width = 16
      Height = 16
      Caption = '10'
    end
    object lDF: TLabel
      Left = 284
      Top = 98
      Width = 16
      Height = 16
      Caption = '11'
    end
  end
end
