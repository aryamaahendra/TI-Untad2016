object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Created By Snow30k'
  ClientHeight = 641
  ClientWidth = 890
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Century Gothic'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object Panel1: TPanel
    Left = 680
    Top = 0
    Width = 210
    Height = 392
    Align = alRight
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitHeight = 517
    object PC1: TPageControl
      Left = 0
      Top = 0
      Width = 210
      Height = 392
      ActivePage = sS
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 517
      object sS: TTabSheet
        Caption = 'Main'
        ExplicitWidth = 344
        ExplicitHeight = 482
        object Label2: TLabel
          Left = 11
          Top = 45
          Width = 64
          Height = 20
          Caption = 'Populasi '
        end
        object Label1: TLabel
          Left = 11
          Top = 14
          Width = 36
          Height = 20
          Caption = 'Max '
        end
        object Label4: TLabel
          Left = 11
          Top = 76
          Width = 48
          Height = 20
          Caption = 'Mutasi'
        end
        object Memo1: TMemo
          Left = 0
          Top = 176
          Width = 202
          Height = 181
          Align = alBottom
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btnProses: TBitBtn
          Left = 3
          Top = 114
          Width = 75
          Height = 25
          Caption = 'Proses'
          TabOrder = 1
          OnClick = btnProsesClick
        end
        object btnBersihkan: TBitBtn
          Left = 84
          Top = 114
          Width = 85
          Height = 25
          Caption = 'Bersihkan'
          TabOrder = 2
          OnClick = btnBersihkanClick
        end
        object btnGenerate: TBitBtn
          Left = 3
          Top = 145
          Width = 135
          Height = 25
          Caption = 'Generate Edge'
          TabOrder = 3
          OnClick = btnGenerateClick
        end
        object edPop: TEdit
          Left = 89
          Top = 42
          Width = 48
          Height = 28
          TabOrder = 4
          Text = '50'
        end
        object Edit1: TEdit
          Left = 89
          Top = 11
          Width = 48
          Height = 28
          TabOrder = 5
          Text = '500'
        end
        object Edit2: TEdit
          Left = 89
          Top = 73
          Width = 48
          Height = 28
          TabOrder = 6
          Text = '0,05'
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 680
    Height = 392
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 522
    ExplicitHeight = 517
    object Canvas: TImage
      Left = 0
      Top = 0
      Width = 680
      Height = 392
      Align = alClient
      OnClick = CanvasClick
      OnDblClick = CanvasDblClick
      OnMouseMove = CanvasMouseMove
      ExplicitLeft = 496
      ExplicitTop = 248
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
    object Label3: TLabel
      Left = 11
      Top = 13
      Width = 130
      Height = 20
      Caption = 'Buat Grapgh Disin'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 392
    Width = 890
    Height = 249
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object Matrix: TStringGrid
      Left = 0
      Top = 0
      Width = 890
      Height = 249
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      DefaultColWidth = 60
      DrawingStyle = gdsGradient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Century Gothic'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      ExplicitTop = 2
      ExplicitHeight = 166
    end
  end
end
